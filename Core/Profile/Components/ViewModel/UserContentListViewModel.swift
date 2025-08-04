//
//  UserContentListViewModel.swift
//  Threads
//
//  Created by Pooja4 Bhagat on 19/07/25.
//

import Foundation

class UserContentListViewModel: ObservableObject {
    @Published var threads = [Thread]()
    
    let user: User
    
    init(user: User) {
        self.user = user
        Task { try await fetchUserThreads() }
    }
    
    @MainActor
    func fetchUserThreads() async throws {
        var threads = try await ThreadService.fetchUserThreads(uid: user.id)
        for i in 0..<threads.count {
            threads[i].user = self.user
        }
        self.threads = threads
    }
}
// 4.43 explanation
