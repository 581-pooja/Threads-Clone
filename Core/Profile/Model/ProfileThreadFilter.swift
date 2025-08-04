//
//  ProfileThreadFilter.swift
//  Threads
//
//  Created by Pooja4 Bhagat on 14/07/25.
//

import Foundation

enum ProfileThreadFilter: Int, CaseIterable, Identifiable {
    case threads
    case replies
    
    var title: String {
        switch self {
        case .threads:
            return "Threads"
        case .replies:
            return "Replies"        }
    }
    
    var id: Int { return self.rawValue }
}

// CaseIterable : To loop over all enum values without manually listing them.
// CaseIterable is a protocol that you can use with enum types to automatically get a collection of all cases in that enum.
