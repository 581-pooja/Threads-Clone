//
//  CurrentUserProfileView.swift
//  Threads
//
//  Created by Pooja4 Bhagat on 16/07/25.
//

import SwiftUI

struct CurrentUserProfileView: View {
    @StateObject var viewModel = CurrentUserProfileViewModel()
    @State var showEditProfileView: Bool = false
    
    // Not understood
    private var currentUser: User? {
        return viewModel.currentUser
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    ProfileHeaderView(user: currentUser)
                    
                    // Follow or Edit Profile or Share button
                    Button {
                        showEditProfileView.toggle()
                    } label: {
                        Text("Edit Profile")
//                            .font(.subheadline)
//                            .fontWeight(.semibold)
//                            .foregroundStyle(.black)
//                            .frame(width: 352, height: 32)
//                            .background(.white)
//                            .cornerRadius(8)
//                            .overlay{
//                                RoundedRectangle(cornerRadius: 10)
//                                    .stroke(Color(.systemGray4), lineWidth: 1)
//                            }
                            .modifier(ThreadsButtonModifier(font: .subheadline, fontWeight: .semibold, width: 352, height: 32, cornerRadius: 8))
                    }
                    
                    // user content
                    UserContentListView(user: currentUser ?? DeveloperPreview.shared.user)
                }
            }
            .sheet(isPresented: $showEditProfileView, content: {
                if let user = currentUser {
                    EditProfileView(user: user)
                }
            })
            .toolbar {
                ToolbarItem(placement: .topBarTrailing){
                    Button {
                        AuthService.shared.signOut()
                    } label : {
                        Image(systemName: "line.3.horizontal")
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    CurrentUserProfileView()
}
