//
//  WorkoutSelectionView.swift
//  One
//
//  Created by Brian Yuan on 2/12/24.
//

import SwiftUI

struct WorkoutSelectionView: View {
    @State private var showingCreateStrengthTraining = false
    @State private var showingCreateCardio = false
    
    var body: some View {
        Spacer()
        HStack {
            Spacer()
            NavigationLink {
                StrengthTrainingView()
            } label: {
                WorkoutOptionCardView(text: "Strength Training", image: "figure.strengthtraining.traditional")
            }
            
            
            NavigationLink {
                CardioTrainingView()
            } label: {
                WorkoutOptionCardView(text: "Cardio Training", image: "figure.run")
            }
            Spacer()
        }
        Spacer()
    }
}

struct StrengthTrainingView: View {
    var body: some View {
        // Your Strength Training view content
        Text("Strength Training View")
    }
}

struct CardioTrainingView: View {
    var body: some View {
        // Your Cardio Training view content
        Text("Cardio Training View")
    }
}

#Preview {
    WorkoutSelectionView()
}

