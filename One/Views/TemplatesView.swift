//
//  WorkoutsView.swift
//  One
//
//  Created by Brian Yuan on 2/12/24.
//

import SwiftUI

struct TemplatesView: View {
    @ObservedObject var authManager = AuthManager.shared
    @State var showSignUpView: Bool = false
    @State var navigateToCreateWorkout: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                // Your existing content...
                Spacer()
                let userAuthed = authManager.isAuthenticated
                if userAuthed {
                    NavigationLink(destination: CreateTemplate()) {
                        Image(systemName: "plus.circle.fill")
                            .foregroundStyle(.green)
                            .font(.system(size: 50))
                    }
                } else {
                    Button(action: {
                        showSignUpView = true
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .foregroundStyle(.green)
                            .font(.system(size: 50))
                    }
                }
            }
            .sheet(isPresented: $showSignUpView) {
                SignUpView()
            }
            .navigationBarTitle("My Templates", displayMode: .automatic)
        }
        .padding()
    }
}

#Preview {
    TemplatesView()
}
