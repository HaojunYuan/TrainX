//
//  WorkoutView.swift
//  One
//
//  Created by Brian Yuan on 2/19/24.
//

import SwiftUI

struct WorkoutCreationView: View {
    @Binding var workouts: [Workout]
    @State private var workoutName: String = ""
    @State private var workoutType: WorkoutType = .chest
    @State private var unit: Unit = .lb
    @State private var sets: [Set] = [Set()]
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
                        let workout = Workout(name: workoutName, workoutType: workoutType, sets: sets, unit: unit)
                        workouts.append(workout)
                        dismiss()
                    } label: {
                        Text("Save")
                    }
                }
            }
        }
    }
    func deleteSet(at index: Int) {
        sets.remove(at: index)
    }
}

#Preview {
    WorkoutCreationView(workouts: .constant([]))
}
