//
//  ExploreViewModel.swift
//  Threads
//
//  Created by Pooja4 Bhagat on 16/07/25.
//

import Foundation
class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task { try await fetchUsers() }
    }
    
    @MainActor
    private func fetchUsers() async throws {
        self.users = try await UserService.fetchUsers()
    }
}

// async happens on background thread & we have to update our user interface on main thread so using mainActor (2.49)
