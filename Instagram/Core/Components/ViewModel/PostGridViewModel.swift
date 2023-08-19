//
//  PostGridViewModel.swift
//  Instagram
//
//  Created by Edgar Vergara on 18/08/23.
//

import Foundation

class PostGridViewModel: ObservableObject {
    private let user: User
    @Published var posts = [Post]()
    
    init(user: User) {
        self.user = user
        
        Task { try await fetchUserPosts() }
    }
    
    @MainActor
    func fetchUserPosts() async throws {
        self.posts = try await PostService.fetchUserPosts(withUid: user.id)

        for i in 0 ..< posts.count {
            posts[i].user = self.user
        }
    }
}
