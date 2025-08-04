//
//  UserService.swift
//  Threads
//
//  Created by Pooja4 Bhagat on 16/07/25.
//

import Firebase
import FirebaseAuth
import FirebaseFirestore

class UserService {
    @Published var currentUser: User?
    
    static let shared = UserService()
    
    init() {
        Task { try await fetchCurrentUser() }
    }
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapShot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapShot.data(as: User.self)
        self.currentUser = user
        print("DEBUG: Current User is \(user)")
    }
    
    static func fetchUsers() async throws -> [User] {
        guard let currentUid = Auth.auth().currentUser?.uid else { return [] }
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let users = snapshot.documents.compactMap({try? $0.data(as: User.self) })
        return users.filter({ $0.id != currentUid })
    }
    
    static func fetchUser(withUid uid: String) async throws -> User {
        let snapShot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        print("Successfully fetched User with ownerId")
        return try snapShot.data(as: User.self)
    }
    
    func reset() {
        self.currentUser = nil
    }
    
    func updateUserProfileImage(withImageUrl imageUrl: String) async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else {
            print("DEBUG: No current user found.")
            return
        }
        try await Firestore.firestore().collection( "users" ).document( currentUid ).updateData([
            "profileImageUrl" : imageUrl
        ])
        print("DEBUG: Profile image URL successfully updated in Firestore.")
    }
    
}

// 3.40 (to understand better)
