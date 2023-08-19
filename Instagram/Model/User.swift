//
//  User.swift
//  Instagram
//
//  Created by Edgar Vergara on 09/08/23.
//

import Foundation
import Firebase

struct User : Identifiable, Hashable, Codable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullName: String?
    var bio: String?
    let email: String
    
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id
    }
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "batman", profileImageUrl: nil, fullName: "Bruce Wayne", bio: "Gotham's Dark Night", email: "batman@gmail.com"),
        .init(id: NSUUID().uuidString, username: "venom", profileImageUrl: nil, fullName: "Eddie Brock", bio: "venom", email: "venom@gmail.com"),
        .init(id: NSUUID().uuidString, username: "ironman", profileImageUrl: nil, fullName: "Tony Stark", bio: "millionaire", email: "ironman@gmail.com"),
        .init(id: NSUUID().uuidString, username: "blackpanther", profileImageUrl: nil, fullName: "Tchalla", bio: "wakanda forever", email: "blackpanther@gmail.com"),
        .init(id: NSUUID().uuidString, username: "spiderman", profileImageUrl: nil, fullName: nil, bio: "friendly", email: "spiderman@gmail.com")
    ]
}
