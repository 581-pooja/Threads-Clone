//
//  ThreadsActionButtonsModifier.swift
//  Threads
//
//  Created by Pooja4 Bhagat on 13/07/25.
//

import SwiftUI

struct ThreadsActionButtonsModifier: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(colorScheme == .dark ? .white : .black)
    }
}
