//
//  RegistrationViewModel.swift
//  Threads
//
//  Created by Pooja4 Bhagat on 15/07/25.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    
    @Published var fullname = ""
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    
    @MainActor
    func createUser() async throws {
        print("DEBUG: Creating user...")
        try await AuthService.shared.createUser(
            withEmail: email,
            password: password,
            fullname: fullname,
            username: username)
    }
}
