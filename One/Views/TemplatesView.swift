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
            
                Spacer()
                NavigationLink(destination: CreateTemplate()) {
                    Image(systemName: "plus.circle.fill")
                        .foregroundStyle(.green)
                        .font(.system(size: 50))
                }
            }
            .navigationBarTitle("My Templates", displayMode: .automatic)
        }
        .padding()
    }
}

#Preview {
    TemplatesView()
}
