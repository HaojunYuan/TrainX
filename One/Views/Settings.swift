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
                authManager.updateUserAuthenticationStatus(isAuthenticated: false)
            } catch {
                print("Error: \(error)")
            }
        }
        
    }
}

struct Settings: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    @StateObject private var viewModel = SettingViewModel()
    
    
    var body: some View {
        NavigationView {
            Form {
                NavigationLink {
                    SignUpView()
                } label: {
                    Text("Sign Up / Log In")
                        .foregroundColor(.blue)
                }
                Toggle(isOn: $isDarkMode) {
                    Text("Dark Mode")
                }
                Button ("Log out") {
                    viewModel.signOut()
                }
                .foregroundColor(.red)
            }
            .navigationTitle("Settings")
            .preferredColorScheme(isDarkMode ? .dark : .light)
            .navigationBarTitle("Settings", displayMode:.automatic)
        }
    }
}


#Preview {
    Group {
        Settings()
    }
}

