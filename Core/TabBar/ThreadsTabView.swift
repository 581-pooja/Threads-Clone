//
//  ThreadsTabView.swift
//  Threads
//
//  Created by Pooja4 Bhagat on 12/07/25.
//

import SwiftUI

struct ThreadsTabView: View {
    @State private var selectedTab: Int = 0
    @State private var showCreateThreadView = false
    var body: some View {
        TabView (selection: $selectedTab){
            FeedView()
                .tabItem {
                    Image(systemName: "house")
                }
                .tag(0)
            
            ExploreView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .tag(1)
            
            Text("")
                .tabItem {
                    Image(systemName: "plus")
                }
                .tag(2)
            
            ActivityView()
                .tabItem {
                    Image(systemName: "heart.fill")
                }
                .tag(3)
            
            
            CurrentUserProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                }
                .tag(4)
        }
        .onChange(of: selectedTab, perform: { newValue in
            showCreateThreadView = (selectedTab == 2)
        })
        .sheet(isPresented: $showCreateThreadView, onDismiss: {
            selectedTab = 0
        }, content: {
            CreateThreadView()
        })
        .tint(.primary)
    }
}

#Preview {
    ThreadsTabView()
}

/* Featues:
 1. Add or store last tab and place back to it
 2. Edit Profile End me
 3. Side Menu too add please
 */
