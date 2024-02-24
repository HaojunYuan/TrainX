//
//  RegistrationView.swift
//  One
//
//  Created by Brian Yuan on 2/16/24.
//

import SwiftUI

struct RegistrationView: View {
    @State var email = ""
    @State var userName = ""
    @State var password = ""
    @State var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        VStack(spacing:24) {
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
                
                InputView(text: $userName,
                          title: "User Name",
                          placeHolder: "Enter your username")

                InputView(text: $password,
                          title: "Password",
                          placeHolder: "Enter your password",
                          isSecureField: true)
                
                ZStack(alignment: .trailing) {
                    InputView(text: $confirmPassword,
                              title: "Confirm Password",
                              placeHolder: "Confirm your password",
                              isSecureField: true)
                    
                    if !password.isEmpty && !confirmPassword.isEmpty {
                        if password == confirmPassword {
                            Image(systemName: "checkmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(Color(.systemGreen))
                        } else {
                            Image(systemName: "xmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(Color(.systemGray))
                        }
                        
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top, 12)
            
            Button {
                Task {
                    try await viewModel.createUser(
                        withEmail: email,
                        password: password, userName: userName)
                }
            } label: {
                HStack {
                    Text("SIGN UP")
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.right")
                }
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 32, height: 48)
            }
            .background(Color(.systemBlue))
            .cornerRadius(10)
            .padding(.top, 24)
            .disabled(!formIsValid)
            .opacity(formIsValid ? 1.0 : 0.5)

            Spacer()
            
            Button {
                dismiss()
            } label: {
                HStack (spacing: 2) {
                    Text("Already have an account?")
                    Text("Sign in")
                        .fontWeight(.bold)
                }
                .font(.system(size: 16))
            }
        }
    }
}

// MARK: -AuthenticationFormProtocol

extension RegistrationView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
        && confirmPassword == password
        && !userName.isEmpty
    }
}

#Preview {
    RegistrationView()
}
