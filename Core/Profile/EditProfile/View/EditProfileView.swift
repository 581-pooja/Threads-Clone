//
//  EditProfileView.swift
//  Threads
//
//  Created by Pooja4 Bhagat on 14/07/25.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    let user: User                 // why said inject with a user
    @State private var bio = ""
    @State private var link = ""
    @State private var isPrivateProfile: Bool = false
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = EditProfileViewModel()
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground)
                    .edgesIgnoringSafeArea([.bottom, .horizontal])
                
                VStack {
                    // Name and Profile Image
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.semibold)
                            Text(user.fullname)
                        }
                        .font(.footnote)
                        Spacer()
                        
                        PhotosPicker(selection: $viewModel.selectedItem) {
                            if let image = viewModel.profileImage {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                            }
                            else {
                                CircularProfileImageView(user: user, size: .small)
                            }
                        }
                    }
                    
                    Divider()
                    
                    // bio field
                    VStack(alignment: .leading) {
                        Text("Bio")
                            .fontWeight(.semibold)
                        TextField("Enter your bio...", text: $bio, axis: .vertical)
                    }
                    
                    Divider()
                    
                    // Link
                    VStack(alignment: .leading) {
                        Text("Link")
                            .fontWeight(.semibold)
                        TextField("Enter your Link...", text: $bio, axis: .vertical)
                    }
                    
                    Divider()
                    
                    // Toggle Private Profile
                    Toggle("Private profile", isOn: $isPrivateProfile)
                }
                .font(.footnote)
                .padding()
                .background(colorScheme == .dark ? .black : .white)
                .cornerRadius(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                }
                .padding()
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .font(.subheadline)
                    .modifier(ThreadsActionButtonsModifier())
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        Task {
                            try await viewModel.updateUserData()
                            dismiss()
                        }
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .modifier(ThreadsActionButtonsModifier())
                }
            }
            
        }
    }
}

#Preview {
    EditProfileView(user : DeveloperPreview.shared.user)
        .preferredColorScheme(.dark)
}

/* In SwiftUI, the .overlay modifier is used to place one view on top of another view, like stacking one layer above another, without replacing the original view.
 
 Purpose  |  Example
 ✅ To show a badge, icon, or image on top of another view  -  A red circle notification badge over an image
 ✅ To add a border or gradient on top of a view - A rounded rectangle stroke or shadow effect
 ✅ To show custom content (like a loading spinner) - Loading indicator over a button or card
 ✅ To combine two views visually - Text over a background image or video
 
 */
