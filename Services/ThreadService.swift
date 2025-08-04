//
//  ThreadService.swift
//  Threads
//
//  Created by Pooja4 Bhagat on 19/07/25.
//

import Foundation
import Firebase

struct ThreadService {
    static func uploadThread(_ thread: Thread) async throws {
        guard let threadData = try? Firestore.Encoder().encode(thread) else { return }
        try await Firestore.firestore().collection("threads").addDocument(data: threadData)
    }
    
    static func fetchThreads() async throws -> [Thread] {
        let snapshot = try await Firestore.firestore()
            .collection("threads")
            .order(by: "timestamp", descending: true)
            .getDocuments()
        print("Debug: Fetched threads")
        return snapshot.documents.compactMap({ try? $0.data(as: Thread.self) })
    }
    
    static func fetchUserThreads(uid: String) async throws -> [Thread] {
        let snapshot = try await Firestore
            .firestore()
            .collection("threads")
            .whereField("ownerUid", isEqualTo: uid)
            .getDocuments()
        
        let threads = snapshot.documents.compactMap({ try? $0.data(as: Thread.self) })
        return threads.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() })
    }
}

// why struct and no class since no need static or shared functionality
// it is fetching & uploading threads & Liking threads   
