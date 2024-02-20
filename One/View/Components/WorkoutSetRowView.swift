//
//  WorkoutSetRowView.swift
//  One
//
//  Created by Brian Yuan on 2/19/24.
//

import SwiftUI

struct WorkoutSetRowView: View {
    @Binding var set: Set
    
    var body: some View {
        HStack {
            TextField("Weight", value: $set.weight, formatter: NumberFormatter())
                .padding()
            TextField("Repetitions", value: $set.repetitions, formatter: NumberFormatter())
                .padding()
        }
        .padding()
        .border(Color.gray, width: 1)
        .cornerRadius(5)
        .padding(.vertical, 5)
    }
}

#Preview {
    WorkoutSetRowView(set: .constant(Set(weight: 45, repetitions: 8)))
}
