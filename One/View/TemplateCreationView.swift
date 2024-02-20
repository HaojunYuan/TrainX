//
//  CreateTemplateView.swift
//  One
//
//  Created by Brian Yuan on 2/19/24.
//

import SwiftUI

struct TemplateCreationView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var templateName: String = ""
    @State private var workouts: [Workout] = []
    
    var body: some View {
        VStack {
            InputView(text: $templateName,
                      title: "Name",
                      placeHolder: "Enter template name")
            
            Spacer()
            
            VStack {
                Spacer()
            }
            
            NavigationLink(destination: WorkoutCreationView(workouts: $workouts)) {
                VStack {
                    Image(systemName: "plus.circle")
                    Text("Add workout")
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.center)
                }
                .aspectRatio(3/2, contentMode: .fit)
                .frame(width: 100, height: 150, alignment: .center)
            }
        }
        .padding()
        .navigationBarTitle(Text("Edit Template"), displayMode: .inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    // TODO: Create new template in Firebase
                    let newTemplate = Template(name: templateName, workouts: workouts)
                    // Handle saving the new template to Firestore or perform any other action here
                    print("New Template:", newTemplate)
                } label: {
                    Text("Save")
                }
            }
        }
    }
}



#Preview {
    TemplateCreationView()
}
