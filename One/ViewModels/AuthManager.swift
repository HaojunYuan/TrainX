//
//  AuthManager.swift
//  One
//
//  Created by Brian Yuan on 2/13/24.
//

import Foundation
import FirebaseAuth

struct AuthDataResultModel {
    let uid: String
    let email: String?
    let photoUrl: String?
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
        self.photoUrl = user.photoURL?.absoluteString
    }
}

final class AuthManager: ObservableObject {
    @Published var isAuthenticated: Bool = false
    static let shared = AuthManager()
    private init() {
        
    }
    
    func getAuthenticatedUser() throws -> AuthDataResultModel {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        
        return AuthDataResultModel(user: user)
    }
    
    func createUser(email: String, password: String) async throws -> AuthDataResultModel {
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthDataResultModel(user: authDataResult.user)
    }
    
    func signOut() throws {
        try Auth.auth().signOut()
    }
    
    func checkUserAuthenticationStatus() -> Bool {
        let authUser = try? AuthManager.shared.getAuthenticatedUser()
        return authUser != nil
    }
    
    func updateUserAuthenticationStatus(isAuthenticated: Bool) {
            self.isAuthenticated = isAuthenticated
        }
}