//
//  ContentViewModel.swift
//  Instagram
//
//  Created by Edgar Vergara on 12/08/23.
//

import Foundation
import FirebaseAuth
import Combine

class ContentViewModel: ObservableObject {
    private let authService = AuthService.shared
    private var cancellables = Set<AnyCancellable>()
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        setupSubscribers()
    }
    
    func setupSubscribers() {
        authService.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &cancellables)
        
        authService.$currentUser.sink { [weak self] currentUser in
            self?.currentUser = currentUser
        }
        .store(in: &cancellables)
    }
}
