//
//  EmailSignIn.swift
//  One
//
//  Created by Brian Yuan on 2/13/24.
//

import SwiftUI


@MainActor
final class EmailSignInViewModel: ObservableObject {
    @ObservedObject var authManager = AuthManager.shared
    @Published var email = ""
    @Published var password = ""
    
    func signUp() {
        guard !email.isEmpty, !password.isEmpty else {
            print("Invalid email or password")
            return
        }
        
        Task {
            do {
                let returnedUserData = try await AuthManager.shared.createUser(email: email, password: password)
                authManager.updateUserAuthenticationStatus(isAuthenticated: true)
                print("Success")
                print(returnedUserData)
            } catch {
                print("Error: \(error)")
            }
            
        }
        
    }
    
}

struct SignUpView: View {
    
    @StateObject private var viewModel = EmailSignInViewModel()
    var body: some View {
        Form {
            Section(header: Text("Sign up with Email")) {
                TextField("Email", text: $viewModel.email)
                SecureField("Password", text: $viewModel.password)
                Button {
                    viewModel.signUp()
                } label: {
                    Text("Sign Up")
                }
                Button {
                    
                } label: {
                    Text("Already have an account? Sign In")
                }
                
                Button(action: {
                    // Handle Google sign up logic
                }) {
                    HStack {
                        Spacer()
                        Image(systemName: "g.circle.fill") // Replace with your Google logo
                        Text("Sign up with Google")
                        Spacer()
                    }
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        SignUpView()
    }
}
