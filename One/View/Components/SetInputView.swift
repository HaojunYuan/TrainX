//
//  SetInputView.swift
//  One
//
//  Created by Brian Yuan on 2/20/24.
//

import SwiftUI

struct SetInputView: View {
    @Binding var value: Int?
    var title: String
    @FocusState private var editing
    
    var body: some View {
        VStack(spacing: 0) {
            Text(title)
                .font(.subheadline)
                .foregroundColor(Color(.systemGray))
            TextField(title, value: $value, format: .number)
                .focused($editing)
                .multilineTextAlignment(.center)
                .textFieldStyle(CustomTextFieldStyle(focused: editing))
        }
        .scaledToFit()
    }
}

struct CustomTextFieldStyle: TextFieldStyle {
    var focused: Bool
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .stroke(focused ? Color(.systemBlue) : Color(.systemGray), lineWidth: focused ? 4 : 2)
        ).padding()
    }
}

#Preview {
    SetInputView(value: .constant(70), title: "Weight")
}
