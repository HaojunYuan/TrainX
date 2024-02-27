//
//  WorkoutsView.swift
//  One
//
//  Created by Brian Yuan on 2/12/24.
//

import SwiftUI

struct WorkoutPlansView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if let user = viewModel.currentUser {
            NavigationView {
                VStack {
                    // TODO: Populate templates view with templates from viewmodel.user
                    ScrollView {
                        if let workoutPlans = user.workoutPlans {
                            let columns = [GridItem(),
                                           GridItem()]
                            LazyVGrid(columns: columns) {
                                ForEach(workoutPlans, id: \.id) { workoutPlan in
                                    let workoutNames = workoutPlan.workouts.map { $0.name } // Extract workout names
                                    WorkoutPlanGridItemView(workoutPlanName: workoutPlan.name, workoutNames: workoutNames)
                                }
                            }
                            .padding()
                        }
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
            .padding()
        } else {
            Text("Loading workout plans...")
        }
    }
}

//#Preview {
//    WorkoutPlansView()
//}
