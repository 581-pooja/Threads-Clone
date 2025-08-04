//
//  ThreadsButtonModifier.swift
//  Threads
//
//  Created by Pooja4 Bhagat on 12/07/25.
//

import SwiftUI

struct ThreadsButtonModifier: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    
    var font: Font
    var fontWeight: Font.Weight
    var width: CGFloat
    var height: CGFloat
    var cornerRadius: CGFloat
    
    
    func body(content: Content) -> some View {
        content
            .font(font)
            .fontWeight(fontWeight)
            .foregroundStyle(colorScheme == .dark ? .black : .white)
            .frame(width: width, height: height)
            .background(colorScheme == .dark ? .white : .black)
            .cornerRadius(cornerRadius)
    }
}
