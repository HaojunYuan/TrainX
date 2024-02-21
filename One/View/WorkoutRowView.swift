//
//  WorkoutRowView.swift
//  One
//
//  Created by Brian Yuan on 2/20/24.
//

import SwiftUI

struct WorkoutRowView: View {
    let workout: Workout
    let expanded: Bool
    
    var body: some View {
        
        VStack {
            HStack {
                Text(workout.name)
                Spacer()
                VStack(alignment: .trailing) {
                    Text("\(workout.sets.count) Sets")
                }
            }.padding(.top, 12)
            Spacer()
            HStack(spacing: expanded ? 20 : -30) {
                Spacer()
                Button(action: {print("star")} ){
                    Image(systemName: "star")
                        .modifier(ToolButtonModifier())
                }
                Button(action: {print("panel")}) {
                    Image(systemName: "chart.bar")
                        .modifier(ToolButtonModifier())
                }
                Button(action: {print("web")}){
                    Image(systemName: "info.circle")
                        .modifier(ToolButtonModifier())
                }
            }
            .padding(.bottom, 12)
            .opacity(expanded ? 1.0 : 0.0)
            .frame(maxHeight: expanded ? .infinity : 0)
            
        }
        .frame(height: expanded ? 120 : 80)
        .padding(.leading, 23)
        .padding(.trailing, 15)
        .background(
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color(.systemGray), style: StrokeStyle(lineWidth: 4))
            }
        )
        .padding(.horizontal)
    }
}

struct ToolButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 25))
            .foregroundColor(.white)
            .frame(width: 30, height: 30)
    }
}

#Preview {
    WorkoutRowView(workout: Workout(name: "Bench Press", workoutType: .chest, sets: [Set(weight: 45, repetitions: 12)], unit: .lb), expanded: false)
}
