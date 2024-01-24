//
//  ListingItemView.swift
//  SharpASF
//
//  Created by SEAN BLAKE on 1/18/24.
//

import SwiftUI

struct ListingItemView: View {
    let listing: Listing
    @State private var isLiked: Bool = false
    
    var body: some View {
        VStack(spacing: 8) {
            // images
            ListingImageCarouselView(listing: listing)
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 25))
            
            // Listing details
            HStack(alignment: .top) {
                // Details
                VStack(alignment: .leading) {
                    Text("\(listing.city), \(listing.state)")
                        .fontWeight(.semibold)
                    
                    Text("12 mi away")
                        .foregroundStyle(.gray)
                    
                    Text("Nov 3 - 10")
                        .foregroundStyle(.gray)
                    
                    HStack(spacing: 4) {
                        Text("$\(listing.pricePerNight)")
                            .fontWeight(.semibold)
                        Text("night")
                    }
                }
                .foregroundStyle(.black)
                Spacer()
                // Ratings
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                    
                    Text("\(listing.rating)")
                }
                .foregroundStyle(.black)
            }
            .font(.footnote)
        }
        .overlay {
            Image(systemName: isLiked ? "heart.fill" : "heart")
                .foregroundStyle(.white)
                .font(.system(size: 24))
                .background {
                    Circle()
                        .frame(width: 40, height: 40)
                        .foregroundStyle(.ultraThinMaterial)
                }
                .offset(x: 150, y: -170)
                .onTapGesture {
                    isLiked.toggle()
                }
        }
    }
}

#Preview {
    ListingItemView(listing: DeveloperPreview.shared.listings[0])
}
