//
//  ContentView.swift
//  One
//
//  Created by Brian Yuan on 2/3/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                HomeView()
                    .environmentObject(viewModel)
            } else {
                LoginView()
            }
        }

    }
}

#Preview {
    ContentView()
}
