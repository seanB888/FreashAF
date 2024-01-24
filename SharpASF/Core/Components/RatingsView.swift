//
//  RatingsView.swift
//  SharpASF
//
//  Created by SEAN BLAKE on 1/19/24.
//

import SwiftUI

struct RatingsView: View {
 let listing: Listing
    var body: some View {
        HStack(spacing: 2) {
            Image(systemName: "star.fill")
            
            Text("\(listing.rating)")
        }
        .foregroundStyle(.black)
    }
}

#Preview {
    RatingsView(listing: DeveloperPreview.shared.listings[0])
}
