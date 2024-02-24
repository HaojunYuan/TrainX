//
//  WorkoutSetRowView.swift
//  One
//
//  Created by Brian Yuan on 2/19/24.
//

import SwiftUI

struct WorkoutSetRowView: View {
    @Binding var set: Set
    var unit: Unit
    var deleteSet: (Set) -> Void
    
    var body: some View {
        HStack(alignment: .center) {
            WorkoutSetInputView(value: $set.weight, title: "Weight")
            WorkoutSetInputView(value: $set.repetitions, title: "Repetitions")
            Text(unit.rawValue)
            Button(action: { deleteSet(set) }) {
                Image(systemName: "trash")
                    .foregroundColor(.red)
            }
        }
    }
}


#Preview {
    WorkoutSetRowView(set: .constant(Set(weight: 45, repetitions: 8)), unit:.lb, deleteSet: {_ in })
}
