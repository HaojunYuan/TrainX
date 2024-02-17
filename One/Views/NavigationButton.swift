//
//  NavigationButton.swift
//  One
//
//  Created by Brian Yuan on 2/16/24.
//

import SwiftUI

struct NavigationButton: View {
    var text: String
    var imageName: String
    
    var body: some View {
        Button {
            print("\(text) button clicked")
        } label: {
            HStack {
                Text(text)
                    .fontWeight(.semibold)
                Image(systemName: imageName)
            }
            .foregroundColor(.white)
            .frame(width: UIScreen.main.bounds.width - 32, height: 48)
        }
        .background(Color(.systemBlue))
        .cornerRadius(10)
        .padding(.top, 24)
    }
}

#Preview {
    NavigationButton(text: "SIGN IN", imageName: "arrow.right")
}
