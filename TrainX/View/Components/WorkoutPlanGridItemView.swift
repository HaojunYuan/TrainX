//
//  WorkoutPlanGridItemView.swift
//  One
//
//  Created by Brian Yuan on 2/21/24.
//

import SwiftUI

struct WorkoutPlanGridItemView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var showUpdatingView = false
    let workoutPlan: WorkoutPlan
    let index: Int
    let maxWorkoutCountToShow = 5
    
    var body: some View {
        VStack(alignment: .leading) {
            // Display workout plan name
            HStack(alignment: .firstTextBaseline) {
                Text(workoutPlan.name == "" ? "New plan" : workoutPlan.name)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.bottom)
                Spacer()
                Menu {
                    Button {
                        self.showUpdatingView.toggle()
                    } label: {
                        Label("Edit", systemImage: "pencil.line")
                    }
                    
                    Button {
                        self.showDeleteAlert()
                    } label: {
                        Label("Delete", systemImage: "trash")
                            .foregroundStyle(.red, .red)
                    }
                } label: {
                    Image(systemName: "gearshape.fill")
                        .foregroundColor(Color(.systemGreen))
                }
                .navigationDestination(isPresented: $showUpdatingView) {
                    UpdateWorkoutPlanView(index: index)
                }
            }
            // Display the first 5 workout names
            let workoutNames = workoutPlan.workouts.map { $0.name }
            Text(workoutNames.prefix(maxWorkoutCountToShow).joined(separator: ", "))
                .foregroundColor(.white)
                .font(.footnote)
            //                .multilineTextAlignment(.leading)
            Spacer()
        }
        .frame(width: 130, height: 120)
        .padding()
        .background(Color.gray)
        .cornerRadius(10)
    }
    
    func showDeleteAlert() {
        let alert = UIAlertController(title: "Delete this workout plan?", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { _ in
            Task {
                try await viewModel.deleteWorkoutPlan(at: index)
            }
        }))
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}

//#Preview {
//    WorkoutPlanGridItemView(index: 1)
//}
