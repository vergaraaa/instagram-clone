//
//  SearchViewModel.swift
//  Instagram
//
//  Created by Edgar Vergara on 14/08/23.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task { try await fetchAllUsers() }
    }
    
    @MainActor
    func fetchAllUsers() async throws {
        self.users = try await UserService.fetchAllUser()
    }
}
