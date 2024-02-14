//
//  ContentView.swift
//  One
//
//  Created by Brian Yuan on 2/3/24.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            TemplatesView()
                .tabItem {
                    Label("Workouts", systemImage: "list.bullet.rectangle")
                }

            History()
                .tabItem {
                    Label("History", systemImage: "calendar")
                }

            ChatGPT()
                .tabItem {
                    Label("Ask AI", systemImage: "message")
                }

            Settings()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

#Preview {
    RootView()
}
