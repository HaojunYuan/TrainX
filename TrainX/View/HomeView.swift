//
//  MainView.swift
//  One
//
//  Created by Brian Yuan on 2/17/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        TabView {
            WorkoutPlansView()
                .environmentObject(viewModel)
                .tabItem {
                    Label("Workouts", systemImage: "list.bullet.rectangle")
                }

            HistoryView()
                .tabItem {
                    Label("History", systemImage: "calendar")
                }

            ChatView()
                .tabItem {
                    Label("Ask AI", systemImage: "message")
                }
            
            FeedView()
                .tabItem {
                    Image(systemName: "house")
                }

            ProfileView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

#Preview {
    HomeView()
}
