//
//  ProfileView.swift
//  Threads
//
//  Created by Pooja4 Bhagat on 13/07/25.
//

import SwiftUI

struct ProfileView: View {
    let user: User               // Dependency Injection
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                ProfileHeaderView(user: user)
                
                // Follow or Edit Profile or Share button
                Button {
                    
                } label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 352, height: 32)
                        .background(.black)
                        .cornerRadius(8)
                }
                
                // user content
                UserContentListView(user: user)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    ProfileView(user: DeveloperPreview.shared.user)
}
