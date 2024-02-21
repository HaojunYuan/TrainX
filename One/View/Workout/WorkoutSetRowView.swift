//
//  WorkoutSetRowView.swift
//  One
//
//  Created by Brian Yuan on 2/19/24.
//

import SwiftUI

struct WorkoutSetRowView: View {
    @Binding var set: Set
    var deleteSet: (Set) -> Void
    
    var body: some View {
        HStack(alignment: .center) {
            SetInputView(value: $set.weight, title: "Weight")
            SetInputView(value: $set.repetitions, title: "Repetitions")
            Button(action: { deleteSet(set) }) {
                Image(systemName: "trash")
                    .foregroundColor(.red)
            }
        }
    }
}


#Preview {
    WorkoutSetRowView(set: .constant(Set(weight: 45, repetitions: 8)), deleteSet: {_ in })
}
