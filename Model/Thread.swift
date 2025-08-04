//
//  Thread.swift
//  Threads
//
//  Created by Pooja4 Bhagat on 19/07/25.
//

import Firebase
import FirebaseFirestore

struct Thread : Identifiable, Codable {
    @DocumentID var threadId: String?
    let ownerUid: String
    let caption: String
    let timestamp: Timestamp
    var likes: Int
    
    var id: String {
        return threadId ?? NSUUID().uuidString
    }
    
    var user: User?
}

// Fetch the Thread -> Update the Ui threads -> Fetch User Data -> Update the User Data (Faster than doing all at once)
// Thread has to be owned by User
// User is Dependent on Thread
// Thread has OwnerId | Use OwnerId to find the user & update the ui
// 4.27 - 4.30
