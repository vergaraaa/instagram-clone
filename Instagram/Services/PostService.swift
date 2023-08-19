//
//  PostService.swift
//  Instagram
//
//  Created by Edgar Vergara on 18/08/23.
//

import Foundation
import Firebase 
struct PostService {
    private static let postCollection = Firestore.firestore().collection("posts")
    
    static func fetchFeedPosts() async throws -> [Post] {
        let snapshot = try await postCollection.getDocuments()
        var posts = try snapshot.documents.compactMap({ try $0.data(as: Post.self) })
        
        for i in 0 ..< posts.count {
            let ownerId = posts[i].ownerUid
            let postUser = try await UserService.fetchUser(withUid: ownerId)
            posts[i].user = postUser
        }
        
        return posts
    }
    
    static func fetchUserPosts(withUid uid: String) async throws -> [Post] {
        let snapshot = try await postCollection.whereField("ownerUid", isEqualTo: uid).getDocuments()
        return try snapshot.documents.compactMap({ try $0.data(as: Post.self) })
    }
}
