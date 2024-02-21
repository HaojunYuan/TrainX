//
//  WorkoutsView.swift
//  One
//
//  Created by Brian Yuan on 2/12/24.
//

import SwiftUI

struct WorkoutPlansView: View {
//    @Environment var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            VStack {

                // TODO: Populate templates view with templates from viewmodel.user
                ScrollView {
                    LazyVGrid(columns: [GridItem(), GridItem()]) {
                        ForEach(0..<10) { _ in // Assuming there are 10 workout plans
                            WorkoutPlanGridItemView()
                        }
                    }
                    .padding()
                }
//                .scrollClipDisabled()
                // Button to create new workout plan
                NavigationLink(destination: WorkoutPlanCreationView()) {
                    VStack {
                        Image(systemName: "plus.circle.fill")
                            .foregroundStyle(.green)
                            .font(.system(size: 40))
                        Text("New workout plan")
                            .padding(.bottom)
                    }
                }
            }
            .navigationBarTitle("My Workout Plans", displayMode: .automatic)
        }
    }
}

#Preview {
    WorkoutPlansView()
}
