//
//  ListingImageCarouselView.swift
//  SharpASF
//
//  Created by SEAN BLAKE on 1/19/24.
//

import SwiftUI

struct ListingImageCarouselView: View {
    let listing: Listing
    
    var body: some View {
        TabView {
            ForEach(listing.imageUrls, id: \.self) { image in
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    ListingImageCarouselView(listing: DeveloperPreview.shared.listings[0])
}
