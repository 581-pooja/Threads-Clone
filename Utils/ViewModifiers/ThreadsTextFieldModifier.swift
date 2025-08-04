//
//  ThreadsTextFieldModifier.swift
//  Threads
//
//  Created by Pooja4 Bhagat on 12/07/25.
//

import SwiftUI

struct ThreadsTextFieldModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 24)
    }
}

