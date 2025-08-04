//
//  ThreadCell.swift
//  Threads
//
//  Created by Pooja4 Bhagat on 13/07/25.
//

import SwiftUI

struct ThreadCell: View {
    let thread : Thread
    
    var body: some View {
        VStack {
            HStack (alignment: .top, spacing: 12){
                CircularProfileImageView(user: thread.user, size: .small)
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(thread.user?.username ?? "")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text(thread.timestamp.timestampString())
                            .font(.caption)
                            .foregroundStyle(Color(.systemGray3))
                        
                        Button {
                            print("Three Dots Menu Tapped.")
                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundStyle(Color(.darkGray))
                        }
                    }
                    
                    // Caption
                    Text(thread.caption)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    
                    // Action Buttons
                    HStack(spacing: 16){
                        Button {
                            print("Like Button Tapped.")
                        } label: {
                            Image(systemName: "heart")
                        }
                        
                        Button {
                            print("Repost Button Tapped.")
                        } label: {
                            Image(systemName: "bubble.right")
                        }
                        
                        Button {
                            print("Like Button Tapped.")
                        } label: {
                            Image(systemName: "arrow.rectanglepath")
                        }
                        
                        Button {
                            print("Share Button Tapped.")
                        } label: {
                            Image(systemName: "paperplane")
                        }
                    }
                    .modifier(ThreadsActionButtonsModifier())
                    .padding(.vertical, 8)
                }
            }
            Divider()
        }
        .padding()
    }
}

#Preview {
    ThreadCell(thread: DeveloperPreview.shared.thread)
}
