//
//  ProfileView.swift
//  One
//
//  Created by Brian Yuan on 2/16/24.
//

import SwiftUI

struct ProfileView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        List {
            Section {
                HStack {
                    Text("Brian")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 70, height: 70)
                        .background(Color(.systemGray3))
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Brian")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .padding(.top, 4)
                        Text("Test@gmail.com")
                            .font(.footnote)
                            .accentColor(.gray)
                    }
                }
                
                
            }
            
            Section("General") {
                HStack {
                    SettingsRowView(imageName: "gear", title: "version", tintColor: Color(.systemGray))
                    
                    Spacer()
                    
                    Text("1.0.0")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Toggle(isOn: $isDarkMode) {
                    Text("Dark Mode")
                }
                .preferredColorScheme(isDarkMode ? .dark : .light)
            }
            
            Section("Account") {
                Button {
                    print("Sign out")
                } label: {
                    SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign out", tintColor: .red)
                }
                
                Button {
                    print("Delete account")
                } label: {
                    SettingsRowView(imageName: "xmark.circle.fill", title: "Delete account", tintColor: .red)
                }
            }
        }
    }
}


#Preview {
    ProfileView()
}
