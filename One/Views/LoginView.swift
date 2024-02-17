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
    
    var onSignUpSuccess: (() -> Void)? {
        didSet {
            if let closure = onSignUpSuccess {
                closure()
            }
        }
    }
    
    func signUp() {
        guard !email.isEmpty, !password.isEmpty else {
            print("Invalid email or password")
            return
        }
        
        Task {
            do {
                let returnedUserData = try await AuthManager.shared.createUser(email: email, password: password)
                print("Success")
                print(returnedUserData)
                onSignUpSuccess?()
            } catch {
                print("Error: \(error)")
            }
            
        }
    }
}

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack(spacing: 24) {
            Image("logo")
                .resizable()
                .scaledToFit()
                .cornerRadius(15)
                .frame(width: 100, height: 120)
                .padding(.vertical, 30)
            VStack(spacing: 24) {
                InputView(text: $email,
                          title: "Email Address",
                          placeHolder: "name@example.com")
                    .autocapitalization(.none)
                InputView(text: $password,
                          title: "Password",
                          placeHolder: "Enter your password",
                          isSecureField: true)
            }
            .padding(.horizontal)
            .padding(.top, 12)
            
            // Sign In
            NavigationButton(text: "SIGN IN", imageName: "arrow.right")
            
            Spacer()
            // Sign Up
            NavigationLink {
                RegistrationView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                HStack (spacing: 2) {
                    Text("Don't have an account?")
                    Text("Sign up")
                        .fontWeight(.bold)
                }
                .font(.system(size: 16))
            }
        }
    }
}

#Preview {
    NavigationStack {
        LoginView()
    }
}
