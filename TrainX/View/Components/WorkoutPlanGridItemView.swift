//
//  WorkoutPlanGridItemView.swift
//  One
//
//  Created by Brian Yuan on 2/21/24.
//

import SwiftUI

struct WorkoutPlanGridItemView: View {
    let workoutPlanName: String
    let workoutNames: [String]
    let maxWorkoutCountToShow = 5
    
    var body: some View {
        VStack(alignment: .leading) {
            // Display workout plan name
            Text(workoutPlanName == "" ? "New workout plan" : workoutPlanName)
                .font(.headline)
                .foregroundColor(.white)
                .padding(.bottom)
            
            // Display the first 5 workout names
            Text(workoutNames.prefix(maxWorkoutCountToShow).joined(separator: ", "))
                .foregroundColor(.white)
            //                .multilineTextAlignment(.leading)
                
        }
        .frame(height: 100)
        .padding()
        .background(Color.gray)
        .cornerRadius(10)
    }
}


#Preview {
    WorkoutPlanGridItemView(workoutPlanName: "", workoutNames: ["Bench Press", "Bicep curl","Bench Press", "Bicep curl","Bench Press", "Bicep curl","Bench Press", "Bicep curl"])
}
