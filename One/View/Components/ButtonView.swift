//
//  ButtonView.swift
//  One
//
//  Created by Brian Yuan on 2/19/24.
//

import SwiftUI

struct ButtonView: View {
    let text: String
    let image: String
    
    var body: some View {
        VStack {
            Image(systemName: image)
            Text(text)
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.center)
            
        }
        .aspectRatio(3/2, contentMode: .fit)
        .frame(alignment: .center)
    }
}

#Preview {
    ButtonView(text: "Create Workout", image: "plus.circle")
}
