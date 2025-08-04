//
//  PreviewProvider.swift
//  Threads
//
//  Created by Pooja4 Bhagat on 16/07/25.
//

import SwiftUI
import Firebase

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = User(
        id: NSUUID().uuidString,
        fullname: "Pooja Bahgat",
        email: "PoojaBhagat58@gmail.com",
        username: "PoojaBhagat581"
    )
    
    let thread = Thread(ownerUid: "123",
                        caption: "this is a thread",
                        timestamp: Timestamp(),
                        likes: 0)
}
