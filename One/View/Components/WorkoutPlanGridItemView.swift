//
//  WorkoutPlanGridItemView.swift
//  One
//
//  Created by Brian Yuan on 2/21/24.
//

import SwiftUI

struct WorkoutPlanGridItemView: View {
    var body: some View {
        VStack {
            // Display workout plan name and some workouts
            Text("Workout Plan")
                .foregroundColor(.white)
                .padding()
                .background(Color.gray)
                .cornerRadius(10)
                .padding(.bottom, 10)
            
            // Display a few workout names
            ForEach(0..<3) { _ in
                Text("Workout Name")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(10)
                    .padding(.bottom, 5)
            }
        }
    }
}


#Preview {
    WorkoutPlanGridItemView()
}
