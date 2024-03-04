//
//  EditWorkoutPlanView.swift
//  TrainX
//
//  Created by Brian Yuan on 3/3/24.
//

import SwiftUI

struct UpdateWorkoutPlanView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var expandingIndex: Int?
    @State private var workoutPlan: WorkoutPlan = WorkoutPlan()
    let index: Int
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading, spacing: 12) {
                Text("Workout Plan Name")
                    .foregroundColor(Color(.darkGray))
                    .fontWeight(.semibold)
                    .font(.headline)
                
                TextField("Enter plan name", text: $workoutPlan.name)
                    .font(.system(size: 16))
            }
            .padding()
            ScrollView {
                ForEach($workoutPlan.workouts.indices, id: \.self) { index in
                    WorkoutRowView(workout: $workoutPlan.workouts[index], expanded: self.expandingIndex == index)
                        .onTapGesture {
                            withAnimation(.spring(response: 0.55,  blendDuration: 0)){
                                if self.expandingIndex != index {
                                    self.expandingIndex = index
                                }
                            }
                        }
                }
            }
            .scrollClipDisabled()
        }
        //        .padding()
        NavigationLink(destination: CreateWorkoutView(workouts: $workoutPlan.workouts)) {
            VStack {
                Image(systemName: "plus.circle.fill")
                    .foregroundStyle(.green)
                    .font(.system(size: 40))
                Text("Add workout")
            }
        }
        .navigationBarTitle(Text("Edit Template"), displayMode: .inline)
        .onFirstAppear {
            if let currentUser = viewModel.currentUser {
                workoutPlan = currentUser.workoutPlans[index]
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    Task {
                        try await viewModel.updateWorkoutPlan(planIndex:index, newName: workoutPlan.name, newWorkouts: workoutPlan.workouts)
                    }
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Save")
                }
            }
        }
    }
}

public extension View {
    func onFirstAppear(_ action: @escaping () -> ()) -> some View {
        modifier(FirstAppear(action: action))
    }
}

private struct FirstAppear: ViewModifier {
    let action: () -> ()
    
    // Use this to only fire your block one time
    @State private var hasAppeared = false
    
    func body(content: Content) -> some View {
        // And then, track it here
        content.onAppear {
            guard !hasAppeared else { return }
            hasAppeared = true
            action()
        }
    }
}


//#Preview {
//    EditWorkoutPlanView()
//}
