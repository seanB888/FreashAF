//
//  ListingDetailView.swift
//  SharpASF
//
//  Created by SEAN BLAKE on 1/19/24.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    @Environment(\.presentationMode) var mode
    let listing: Listing
    @State private var cameraPosition: MapCameraPosition
    
    init(listing: Listing) {
        self.listing = listing
        
        let region = MKCoordinateRegion(center: listing.city == "Los Angeles" ? .losAngeles : .miami, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
        
        self._cameraPosition = State(initialValue: .region(region))
    }
    
    var body: some View {
        ScrollView {
            ZStack(alignment:.topLeading) {
                ListingImageCarouselView(listing: listing)
                    .frame(height: 320)
                
                // MARK: - Back button
                Button(action: {
                    mode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                    // .font(.largeTitle)
                        .background {
                            Circle()
                                .frame(width: 40, height: 40)
                                .foregroundStyle(.ultraThinMaterial)
                        }
                })
                .padding(32)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text("\(listing.title)")
                    .font(.title)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading) {
                    HStack {
                        RatingsView(listing: listing)
                        
                        Text("-")
                        
                        Text("28 reviews")
                            .fontWeight(.semibold)
                            .underline()
                    }
                    
                    Text("\(listing.city), \(listing.state)")
                }
                .font(.caption)
                .foregroundStyle(.black)
            }
            .padding(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
            
            // MARK: - Host info view
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Entire \(listing.type.description) hosted by")
                    Text("\(listing.ownerName)")
                    
                    HStack(spacing: 2) {
                        Text("\(listing.numofGuest) guest - \(listing.numofBedroom) bedrooms - \(listing.numofBathroom) beds - \(listing.numofBathroom) baths")
                            .font(.caption)
                    }
                }
                .font(.headline)
                .frame(width: 250)
                
                Spacer()
                
                Image("\(listing.ownerUrl)")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                    .padding(.trailing, 5)
            }
            .padding()
            
            Divider()
            
            // MARK: - Listing Features
            VStack(alignment: .leading, spacing: 16) {
                ForEach(listing.features) { feature in
                    FeatureIconAndText(featureIcon: feature.imageName, titleText: feature.title, descriptionText: feature.subtitle)
                }
                
            }
            .padding()
            
            Divider()
            
            // MARK: - Number of bedrooms carousel
            VStack(alignment: .leading, spacing: 16) {
                Text("Number of bedrooms")
                    .font(.title3.bold())
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(1 ... listing.numofBedroom, id: \.self) { bedrooms in
                            RoomCard(bedroomCount: (bedrooms+0))
                        }
                    }
                }
                .scrollTargetBehavior(.paging)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
            // MARK: - House amenities
            VStack(alignment: .leading, spacing: 5) {
                Text("What this place offers")
                    .font(.title3.bold())
                
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(listing.amenities) { amenity in
                        IconAndText(icon: amenity.imageName, title: amenity.title)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
            
            Divider()
            
            // MARK: - Map View
            VStack {
                Text("Where House is located")
                
                Map(position: $cameraPosition)
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding()
        }
        .toolbar(.hidden, for: .tabBar)
        .padding(.bottom, 80)
        .ignoresSafeArea()
        .overlay(alignment: .bottom) {
            VStack {
                Divider()
                    .padding(.bottom)
                
                HStack {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("$\(listing.pricePerNight)")
                            .font(.subheadline)
                            .fontWeight(.bold)
                        
                        Text("Total before Taxes")
                            .font(.caption)
                        
                        Text("Oct 15 - 20")
                            .font(.caption)
                            .underline()
                            .fontWeight(.semibold)
                        
                    }
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Reserve")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 110, height: 40)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    })
                }
                .padding(.horizontal, 30)
            }
            .frame(height: 65)
            .background(.white)
        }
    }
}

#Preview {
    ListingDetailView(listing: DeveloperPreview.shared.listings[0])
}

