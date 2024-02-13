//
//  WorkoutsView.swift
//  One
//
//  Created by Brian Yuan on 2/12/24.
//

import SwiftUI

struct WorkoutsView: View {
    @State private var showingCreateWorkout = false
    
    var body: some View {
        NavigationView {
            VStack {
                //                LazyVGrid {
                //                    // TODO: Fetch workout plans and display
                //                }
                Spacer()
                NavigationLink {
                    WorkoutSelectionView()
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .foregroundStyle(.green)
                        .font(.system(size: 50))
                }
            }
            .navigationBarTitle("My Templates", displayMode:.automatic)
        }
        .padding()
    }
}

#Preview {
    WorkoutsView()
}
