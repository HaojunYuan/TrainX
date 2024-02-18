//
//  ProfileView.swift
//  One
//
//  Created by Brian Yuan on 2/16/24.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        if let user = viewModel.currentUser {
            List {
                Section {
                    HStack {
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 70, height: 70)
                            .background(Color(.systemGray3))
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(user.userName)
                                .fontWeight(.semibold)
                                .padding(.top, 4)
                            Text(user.email)
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                    }
                    
                    
                }
                
                Section("General") {
                    HStack {
                        SettingsRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
                        
                        Spacer()
                        
                        Text("1.0.0")
                            .foregroundColor(.gray)
                    }
                    Toggle(isOn: $isDarkMode) {
                        Text("Dark Mode")
                    }
                    .preferredColorScheme(isDarkMode ? .dark : .light)
                }
                
                Section("Account") {
                    Button {
                        viewModel.signOut()
                    } label: {
                        SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign out", tintColor: .red)
                    }
                    
//                    Button {
//                        print("Delete account")
//                    } label: {
//                        SettingsRowView(imageName: "xmark.circle.fill", title: "Delete account", tintColor: .red)
//                    }
                }
            }
        } else {
            Text("Loading Profile...")
        }
    }
}


#Preview {
    ProfileView()
}
