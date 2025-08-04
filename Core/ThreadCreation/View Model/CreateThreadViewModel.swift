//
//  CreateThreadViewModel.swift
//  Threads
//
//  Created by Pooja4 Bhagat on 19/07/25.
//

import Foundation
import Firebase
import FirebaseAuth

class CreateThreadViewModel: ObservableObject {
    func uploadThread(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let thread = Thread(ownerUid: uid, caption: caption, timestamp: Timestamp(), likes: 0)
        try await ThreadService.uploadThread(thread)
    }
}
