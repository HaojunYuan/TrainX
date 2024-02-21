//
//  WorkoutsView.swift
//  One
//
//  Created by Brian Yuan on 2/12/24.
//

import SwiftUI

struct TemplatesView: View {
//    @Environment var viewModel: AuthViewModel
    
    
    var body: some View {
        NavigationStack {
            // TODO: Populate templates view with templates from viewmodel.user
            VStack {
                Spacer()
                NavigationLink(destination: TemplateCreationView()) {
                    VStack {
                        Image(systemName: "plus.circle.fill")
                            .foregroundStyle(.green)
                            .font(.system(size: 40))
                        Text("New template")
                    }
                }
            }
            .navigationBarTitle("My Templates", displayMode: .automatic)
        }
        .padding(.bottom)
    }
}

#Preview {
    TemplatesView()
}
