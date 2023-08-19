//
//  RegistrationViewModel.swift
//  Instagram
//
//  Created by Edgar Vergara on 12/08/23.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var username = ""
    
    func createUser() async throws {
        try await AuthService.shared.createUser(
            email: email,
            password: password,
            username: username
        )
        
        email = ""
        password = ""
        username = ""
    }
}
