//
//  User.swift
//  Threads
//
//  Created by Pooja4 Bhagat on 16/07/25.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    let id: String
    let fullname: String
    let email: String
    let username: String
    var profileImageUrl: String?
    var bio: String?
}
