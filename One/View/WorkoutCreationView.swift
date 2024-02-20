//
//  WorkoutView.swift
//  One
//
//  Created by Brian Yuan on 2/19/24.
//

import SwiftUI

struct WorkoutCreationView: View {
    @Binding var workouts: [Workout]
    @State private var name: String = ""
    @State private var workoutType: WorkoutType = .chest
    @State private var unit: Unit = .kg
    @State private var sets: [Set] = [Set(repetitions: 0)] // Initial set
    
    var body: some View {
        VStack {
            TextField("Workout Name", text: $name)
                .padding()
            Picker("Workout Type", selection: $workoutType) {
                ForEach(WorkoutType.allCases, id: \.self) { type in
                    Text(type.rawValue.capitalized)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            Picker("Unit", selection: $unit) {
                ForEach(Unit.allCases, id: \.self) { unit in
                    Text(unit.rawValue)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            ScrollView {
                ForEach(sets.indices, id: \.self) { index in
                    WorkoutSetRowView(set: $sets[index])
                }
            }
            Button("Add new set") {
                sets.append(Set(repetitions: 0))
            }
            .padding()
            Button("Save") {
                let workout = Workout(name: name, workoutType: workoutType, sets: sets, unit: unit)
                workouts.append(workout)
            }
            .padding()
        }
        .padding()
    }
}


#Preview {

    WorkoutCreationView(workouts: .constant([]))
}
