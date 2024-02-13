//
//  ContentView.swift
//  One
//
//  Created by Brian Yuan on 2/3/24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            WorkoutsView()
                .tabItem {
                    Label("Workouts", systemImage: "figure.highintensity.intervaltraining")
                }

            HistoryView()
                .tabItem {
                    Label("History", systemImage: "calendar")
                }

            ChatGPTView()
                .tabItem {
                    Label("Ask AI", systemImage: "message")
                }

            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

#Preview {
    MainTabView()
}
