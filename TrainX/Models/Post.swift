//
//  Post.swift
//  TrainX
//
//  Created by Brian Yuan on 3/16/24.
//

//  Referece: https://github.com/sergeyleschev/social-network/blob/main/SocialNetwork/Model/Post.swift 

import FirebaseFirestoreSwift
import Firebase

struct Post: Identifiable, Decodable {
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    let uid: String
    var likes: Int
    let imageUrl: String?
    
    var user: User?
    var didLike: Bool? = false
}
