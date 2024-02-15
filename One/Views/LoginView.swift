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
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel = EmailSignInViewModel()
    var body: some View {
        VStack(spacing:24) {
            InputView(text: $viewModel.email, title: "Email Address", placeHolder: "name@example.com")
            InputView(text: $viewModel.password, title: "Password", placeHolder: "Enter your password", isSecureField: true)
        }
        .padding(.horizontal)
        .padding(.top, 12)
        
        // Sign In
        
        Spacer()
        
        // Sign Up
    }
}

#Preview {
    NavigationStack {
        LoginView()
    }
}
