//
//  AuthViewModel.swift
//  One
//
//  Created by Brian Yuan on 2/17/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

protocol AuthenticationFormProtocol {
    var formIsValid: Bool { get }
}

@MainActor
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        Task {
            await fetchUser()
        }
    }
    
    func signIn(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        } catch {
            print("DEBUG: Failed to log in with error: \(error.localizedDescription)")
        }
    }
    
    func createUser(withEmail email: String, password: String, userName: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, userName: userName, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
        } catch {
            print("DEBUG: Failed to create user with error: \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
        } catch {
            print("DEBUG: Failed to sign out with error: \(error.localizedDescription)")
        }
    }
    
    func deleteAccount() {
        
    }
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        self.currentUser = try? snapshot.data(as: User.self)
    }
    
    // MARK: - Template CRUD Operations
    
    func createTemplate(name: String, workouts: [Workout]) async throws {
        guard let currentUser = self.currentUser else {
            print("DEBUG: No current user.")
            return
        }
        
        let newTemplate = WorkoutPlan(name: name, workouts: workouts)
        var userTemplates = currentUser.templates ?? []
        userTemplates.append(newTemplate)
        
        do {
            try await Firestore.firestore().collection("users").document(currentUser.id).updateData(["templates": userTemplates.map { try? Firestore.Encoder().encode($0) }])
            await fetchUser()
        } catch {
            print("DEBUG: Failed to create template with error: \(error.localizedDescription)")
        }
    }
    
    func updateTemplate(templateIndex: Int, newName: String, newWorkouts: [Workout]) async throws {
        guard var currentUser = self.currentUser else {
            print("DEBUG: No current user.")
            return
        }
        
        guard templateIndex >= 0 && templateIndex < currentUser.templates?.count ?? 0 else {
            print("DEBUG: Invalid template index.")
            return
        }
        
        currentUser.templates?[templateIndex].name = newName
        currentUser.templates?[templateIndex].workouts = newWorkouts
        
        do {
            try await Firestore.firestore().collection("users").document(currentUser.id).updateData(["templates": currentUser.templates?.map { try? Firestore.Encoder().encode($0) } ?? []])
            await fetchUser()
        } catch {
            print("DEBUG: Failed to update template with error: \(error.localizedDescription)")
        }
    }
    
    func deleteTemplate(at index: Int) async throws {
        guard var currentUser = self.currentUser else {
            print("DEBUG: No current user.")
            return
        }
        
        guard index >= 0 && index < currentUser.templates?.count ?? 0 else {
            print("DEBUG: Invalid template index.")
            return
        }
        
        currentUser.templates?.remove(at: index)
        
        do {
            try await Firestore.firestore().collection("users").document(currentUser.id).updateData(["templates": currentUser.templates?.map { try? Firestore.Encoder().encode($0) } ?? []])
            await fetchUser()
        } catch {
            print("DEBUG: Failed to delete template with error: \(error.localizedDescription)")
        }
    }
    
    // MARK: - Simple View for Creating Template (for testing)
    
    func createTemplateForTesting() {
        let newTemplate = WorkoutPlan(name: "Test Template", workouts: [Workout(name: "Bench press", workoutType: .chest, sets: [], unit: .lb)])
        
        Task {
            do {
                try await createTemplate(name: newTemplate.name, workouts: newTemplate.workouts)
                print("Template created successfully.")
            } catch {
                print("Failed to create template: \(error.localizedDescription)")
            }
        }
    }
}
