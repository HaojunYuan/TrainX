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
                
                InputView(text: $confirmPassword,
                          title: "Confirm Password",
                          placeHolder: "Confirm your password",
                          isSecureField: true)
            }
            .padding(.horizontal)
            .padding(.top, 12)
            
            NavigationButton(text: "SIGN UP", imageName: "arrow.right")
            
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

#Preview {
    RegistrationView()
}
