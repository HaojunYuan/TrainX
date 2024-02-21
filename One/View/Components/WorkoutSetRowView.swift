//
//  WorkoutSetRowView.swift
//  One
//
//  Created by Brian Yuan on 2/19/24.
//

import SwiftUI

struct WorkoutSetRowView: View {
    @Binding var set: Set
    var onDelete: () -> Void
    
    var body: some View {
        HStack {
            SetInputView(value: $set.weight, title: "Weight")
            SetInputView(value: $set.repetitions, title: "Repetitions")
            Button {
                onDelete()
            } label: {
                Image(systemName: "trash")
            }
        }
//        .padding(5)
//        .overlay(
//            RoundedRectangle(cornerRadius: 15)
//                .stroke(Color(.systemGray), lineWidth: 1.5)
//        )
    }
}




#Preview {
    WorkoutSetRowView(set: .constant(Set(weight: 45, repetitions: 8)), onDelete: {})
}
