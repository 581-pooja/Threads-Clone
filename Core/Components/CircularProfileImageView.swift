//
//  CircularProfileImageView.swift
//  Threads
//
//  Created by Pooja4 Bhagat on 13/07/25.
//

import SwiftUI
import Kingfisher
import FirebaseAuth

enum ProfileImageSize {
    case xxSmall
    case xSmall
    case small
    case medium
    case large
    case xLarge
    
    var dimension: CGFloat {
        switch self {
        case .xxSmall: return 28
        case .xSmall: return 32
        case .small: return 40
        case .medium: return 48
        case .large: return 64
        case .xLarge: return 80
        }
    }
}

struct CircularProfileImageView: View {
    var user: User?
    let size: ProfileImageSize
    
    var body: some View {
        if let imageUrl = user?.profileImageUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: size.dimension, height: size.dimension)
                .foregroundColor(Color(.systemGray4))
        }
    }
}

#Preview {
    CircularProfileImageView(user: DeveloperPreview.shared.user, size: .small)
}

// Loading image using KingFisher Image for better caching
/* why KingFisher used for Images:
 🔁 Automatic disk & memory caching: Once an image is downloaded, Kingfisher saves it to disk and memory.
 📶 Reduces network calls: Already-downloaded images won’t be fetched again.
 ⚡️ Faster image loading: Helps display images quickly when users revisit screens.
 🧵 Downloads happen in the background, keeping the UI responsive. */
