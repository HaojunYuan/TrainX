//
//  ChatViewModel.swift
//  TrainX
//
//  Created by Brian Yuan on 3/10/24.
//

import Foundation

extension ChatView {
    class ViewModel: ObservableObject {
        @Published var messages: [Message] = []
        
        @Published var inputMessage: String = ""
        private let openAIService = OpenAIService()
        func sendMessage() {
            let message = Message(id: UUID(), role: .user, content: inputMessage, createAt: Date())
            messages.append(message)
            inputMessage = ""
            
            Task {
                let response = await openAIService.sendMessage(messages: messages)
                guard let receivedOpenAIMessages = response?.choices.first?.message else {
                    print("No received message")
                    return
                }
                let receivedMessage = Message(id: UUID(), role: receivedOpenAIMessages.role, content: receivedOpenAIMessages.content, createAt: Date())
                await MainActor.run {
                    messages.append(receivedMessage)
                }
            }
        }
    }
}

struct Message: Decodable {
    let id: UUID
    let role: SenderRole
    let content: String
    let createAt: Date
}
