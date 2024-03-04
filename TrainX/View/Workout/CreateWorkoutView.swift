//
//  WorkoutView.swift
//  One
//
//  Created by Brian Yuan on 2/19/24.
//

import SwiftUI

struct CreateWorkoutView: View {
    @Binding var workouts: [Workout]
    @State var workoutName: String = ""
    @State var workoutType: WorkoutType = .chest
    @State var unit: Unit = .lb
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            VStack (alignment: .leading, spacing: 12) {
                Text("Name")
                    .foregroundColor(Color(.darkGray))
                    .fontWeight(.semibold)
                    .font(.headline)
                
                TextField("Enter workout name", text: $workoutName)
                    .font(.system(size: 16))
            }
            
            Picker("Workout Type", selection: $workoutType) {
                ForEach(WorkoutType.allCases, id: \.self) { type in
                    Text(type.rawValue.capitalized)
                }
            }
            .pickerStyle(.menu)
            
            Picker("Unit", selection: $unit) {
                ForEach(Unit.allCases, id: \.self) { unit in
                    Text(unit.rawValue)
                }
            }
            .pickerStyle(.menu)
            .navigationBarTitle(Text("New Workout"), displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        let workout = Workout(name: workoutName, workoutType: workoutType, unit: unit)
                        workouts.append(workout)
                        dismiss()
                    } label: {
                        Text("Save")
                    }
                }
            }
        }
    }
}

//#Preview {
//    WorkoutCreationView(workouts: .constant([]))
//}
