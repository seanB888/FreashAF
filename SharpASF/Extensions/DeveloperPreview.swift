//
//  DeveloperPreview.swift
//  SharpASF
//
//  Created by SEAN BLAKE on 1/21/24.
//

import Foundation

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    var listings: [Listing] = [
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Sean Blake",
            ownerUrl: "profile",
            numofBedroom: 4,
            numofBathroom: 2,
            numofGuest: 3,
            pricePerNight: 600,
            latitude: 26.114119,
            longitude: -80.150927, 
            imageUrls: ["listings-1", "listings-2", "listings-3"],
            address: "604 SW",
            addressApt: "",
            city: "Fort Lauderdale",
            state: "Florida",
            zip: "333015",
            title: "Lauderdale by The Beach",
            rating: 5.05,
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .kitchen, .tv,],
            type: .townHouse
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Lisa Blake",
            ownerUrl: "profile-1",
            numofBedroom: 2,
            numofBathroom: 2,
            numofGuest: 3,
            pricePerNight: 1600,
            latitude: 26.114119,
            longitude: -80.150927,
            imageUrls: ["listings-4", "listings-5", "listings-6"],
            address: "604 SW",
            addressApt: "",
            city: "Miami",
            state: "Florida",
            zip: "33085",
            title: "The Grove",
            rating: 5.05,
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .kitchen, .tv,],
            type: .townHouse
        )
    ]
}

