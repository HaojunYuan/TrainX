//
//  MessageView.swift
//  TrainX
//
//  Created by Brian Yuan on 3/10/24.
//

import SwiftUI

struct MessageView: View {
    let message: Message
    
    var body: some View {
        HStack {
            if message.role == .user {
                Spacer()
            }
            
            MessageBubble(message: message)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
            
            if message.role == .assistant {
                Spacer()
            }
        }
    }
}

struct MessageBubble: View {
    let message: Message
    
    var body: some View {
        Text(message.content)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(message.role == .user ? Color.green : Color.gray.opacity(0.2))
            .cornerRadius(10.0)
    }
}

#Preview {
    MessageView(message: Message(id: UUID(), role: .user, content: "Hello", createAt: Date()))
}
