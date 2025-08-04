//
//  UserCell.swift
//  Threads
//
//  Created by Pooja4 Bhagat on 13/07/25.
//

import SwiftUI

struct UserCell: View {
    let user: User
    var body: some View {
        HStack {
            CircularProfileImageView(user: user, size: .small)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(user.username)
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Text(user.fullname)
                    .font(.footnote)
            }
            
            Spacer()
            
            Button {
                print("Follow Button Tapped.")
            } label: {
                Text("Follow")
                    .modifier(ThreadsButtonModifier(font: .footnote  ,fontWeight: .semibold, width: 100, height: 32, cornerRadius: 8))
                
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    UserCell(user: DeveloperPreview.shared.user)
}
