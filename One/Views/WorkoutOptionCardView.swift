//
//  WorkoutOptionCardView.swift
//  One
//
//  Created by Brian Yuan on 2/12/24.
//

import SwiftUI

struct WorkoutOptionCardView: View {
    var text: String
    var image: String
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                    .fill(Color.green)
                
                VStack(spacing: DrawingConstants.spacing) {
                    Image(systemName: image)
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.white)
                    Text(text)
                        .foregroundColor(.white)
                        .font(.headline)
                        .bold()
                }
                .padding(.all, DrawingConstants.padding)
            }
            .aspectRatio(2/3, contentMode: .fit)
        }
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
        static let padding: CGFloat = 20
        static let spacing: CGFloat = 10
        static let imageWidth: CGFloat = 60
        static let imageHeight: CGFloat = 60
    }
}

#Preview {
    WorkoutOptionCardView(text: "Strength Training", image:"figure.strengthtraining.traditional")
}
