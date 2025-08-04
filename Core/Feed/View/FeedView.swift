//
//  FeedView.swift
//  Threads
//
//  Created by Pooja4 Bhagat on 13/07/25.
//

import SwiftUI

struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEach(viewModel.threads) { thread in
                        ThreadCell(thread: thread)
                    }
                }
            }
            
            .refreshable {
                Task { try await viewModel.fetchThreads() }
                print("DEBUG: Refreshing threads...")
            }
            .navigationTitle("Threads")
            .navigationBarTitleDisplayMode(.inline)
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        print("Successfull Refresh!")
                        Task { try await viewModel.fetchThreads() }
                    } label: {
                        Image(systemName: "arrow.counterclockwise")
                            
                    }
                    .modifier(ThreadsActionButtonsModifier())
                }
            }
        }
        
    }
}

#Preview {
    FeedView()
}
/* LazyVStack: Load only view when shown on screen */
