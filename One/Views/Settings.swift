//
//  SettingsView.swift
//  One
//
//  Created by Brian Yuan on 2/12/24.
//

import SwiftUI

final class SettingViewModel: ObservableObject {
    @ObservedObject var authManager = AuthManager.shared
    
    func signOut() {
        Task {
            do {
                try AuthManager.shared.signOut()
            } catch {
                print("Error: \(error)")
            }
        }
        
    }
}

struct Settings: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    @StateObject private var viewModel = SettingViewModel()
    @State private var isAuthenticated = false // Track authentication status
    
    var body: some View {
        NavigationView {
            Form {
                if isAuthenticated {
                    if let userId = try? viewModel.authManager.getAuthenticatedUser().uid {
                        Text("Welcome, user \(userId)!")
                    } else {
                        Text("Error getting user information")
                    }
                    Button("Log out") {
                        viewModel.signOut()
                    }
                    .foregroundColor(.red)
                } else {
                    NavigationLink {
                        LoginView()
                    } label: {
                        Text("Sign Up / Log In")
                            .foregroundColor(.blue)
                    }
                }
                Toggle(isOn: $isDarkMode) {
                    Text("Dark Mode")
                }
            }
            .navigationTitle("Settings")
            .preferredColorScheme(isDarkMode ? .dark : .light)
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}



#Preview {
    Group {
        Settings()
    }
}

