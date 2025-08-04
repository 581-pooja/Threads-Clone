//
//  EditProfileViewModel.swift
//  Threads
//
//  Created by Pooja4 Bhagat on 17/07/25.
//

import PhotosUI
import SwiftUI

class EditProfileViewModel: ObservableObject {
    @Published var selectedItem: PhotosPickerItem? {
        didSet { Task { await loadImage() }}
    }
    @Published var profileImage: Image?
    private var uiImage: UIImage?
    
    func updateUserData() async throws {
        print("DEBUG: Updating user data...")
        try await updateProfileImage()
        // Add other user data update logic here if needed
    }
    
    @MainActor
    private func loadImage() async {
        guard let item = selectedItem else { return }
        
        //        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        //        guard let uiImage = UIImage(data: data) else { return }
        //        self.uiImage = uiImage
        //        self.profileImage = Image(uiImage: uiImage)
        
        do {
            if let data = try await item.loadTransferable(type: Data.self),
               let uiImage = UIImage(data: data) {
                self.uiImage = uiImage
                self.profileImage = Image(uiImage: uiImage)
            }
        } catch {
            print("DEBUG: Failed to load image data: \(error.localizedDescription)")
        }
    }
    
    /* For Firebase Storage
     private func updateProfileImage() async throws {
     guard let image = self.uiImage else { return }
     guard let imageUrl = try? await ImageUploader.uploadImage(image) else { return }
     try await UserService.shared.updateUserProfileImage(withImageUrl: imageUrl)
     }
     */
    
    private func updateProfileImage() async throws {
        guard let image = self.uiImage else { return }
        
        // Upload image to Cloudinary
        try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Void, Error>) in
            CloudinaryUploader.uploadImageToCloudinary(image) { result in
                switch result {
                case .success(let imageUrl):
                    Task {
                        do {
                            try await UserService.shared.updateUserProfileImage(withImageUrl: imageUrl)
                            try await UserService.shared.fetchCurrentUser()
                            continuation.resume()
                        } catch {
                            continuation.resume(throwing: error)
                        }
                    }
                case .failure(let error):
                    print("DEBUG: Cloudinary upload failed: \(error.localizedDescription)")
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
}
