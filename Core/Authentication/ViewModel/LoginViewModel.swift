//
//  LoginViewModel.swift
//  Threads
//
//  Created by Pooja4 Bhagat on 15/07/25.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    @MainActor
    func login() async throws {
        try await AuthService.shared.login(
            withEmail: email,
            password: password)
    }
}
