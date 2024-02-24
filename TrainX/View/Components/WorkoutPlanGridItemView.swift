//
//  WorkoutPlanGridItemView.swift
//  One
//
//  Created by Brian Yuan on 2/21/24.
//

import SwiftUI

struct WorkoutPlanGridItemView: View {
    let workoutName: String
    var body: some View {
        VStack {
            // Display workout plan name and some workouts
            Text(workoutName)
                .foregroundColor(.white)
                .padding()
                .background(Color.gray)
                .cornerRadius(10)
                .padding(.bottom, 10)
        }
    }
}


//#Preview {
//    WorkoutPlanGridItemView()
//}
