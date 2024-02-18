//
//  User.swift
//  One
//
//  Created by Brian Yuan on 2/17/24.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let userName: String
    let email: String
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let component = formatter.personNameComponents(from: userName) {
            formatter.style = .abbreviated
            return formatter.string(from: component)
        }
        
        return ""
    }
}

extension User {
    static var mock_user = User(id: NSUUID().uuidString, userName: "Brian Yuan", email: "test@gmail.com")
}
