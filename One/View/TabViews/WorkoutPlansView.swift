//
//  WorkoutsView.swift
//  One
//
//  Created by Brian Yuan on 2/12/24.
//

import SwiftUI

struct WorkoutPlansView: View {
    @Environment var viewModel: AuthViewModel
    
    var body: some View {
        if let user = viewModel.currentUser {
            NavigationView {
                VStack {
                    // TODO: Populate templates view with templates from viewmodel.user
                    ScrollView {
                        if let templates = user.templates {
                            LazyVGrid(columns: [GridItem(), GridItem()]) {
                                ForEach(templates, id: \.id) { template in
                                    WorkoutPlanGridItemView(workoutName: template.name)
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
        } else {
            Text("Loading workout plans...")
        }
    }
}

//#Preview {
//    WorkoutPlansView()
//}
