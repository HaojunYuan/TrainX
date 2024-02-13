//
//  SettingsView.swift
//  One
//
//  Created by Brian Yuan on 2/12/24.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.colorScheme) var colorScheme
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    init(){
        isDarkMode = colorScheme == .dark ? true : false
    }

    var body: some View {
        Form {
            Section(header: Text("Appearance")) {
                Toggle(isOn: $isDarkMode) {
                    Text("Dark Mode")
                }
            }
        }
        .navigationTitle("Settings")
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}


#Preview {
    Group {
        SettingsView()
    }
}

