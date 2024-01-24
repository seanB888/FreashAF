//
//  TabBarView.swift
//  SharpASF
//
//  Created by SEAN BLAKE on 1/20/24.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            ExploreView()
                .tabItem { Label("Explore", systemImage: "magnifyingglass") }
            
            WishlistView()
                .tabItem { Label("Wishlist", systemImage: "heart") }
            
            ProfileView(data: ProfileSettingsData[0])
                .tabItem { Label("Profile", systemImage: "person") }
        }
    }
}

#Preview {
    TabBarView()
}
