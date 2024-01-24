//
//  Listing.swift
//  SharpASF
//
//  Created by SEAN BLAKE on 1/20/24.
//

import Foundation

struct Listing: Identifiable, Codable,Hashable {
    let id: String
    let ownerUid: String
    let ownerName: String
    let ownerUrl: String
    let numofBedroom: Int
    let numofBathroom: Int
    let numofGuest: Int
    var pricePerNight: Int
    let latitude: Double
    let longitude: Double
    var imageUrls: [String]
    let address: String
    let addressApt: String
    let city: String
    let state: String
    let zip: String
    let title: String
    var rating: Double
    var features: [ListingFeatures]
    var amenities: [ListingAmenities]
    var type: ListingType
}

enum ListingFeatures: Int, Codable, Identifiable, Hashable {
    case selfCheckIn
    case superHost
    
    var imageName: String {
        switch self {
        case .selfCheckIn: return "door.left.hand.open"
        case .superHost: return "medal"
        }
    }
    
    var title: String {
        switch self {
        case .selfCheckIn:
            return "Self check-in"
        case .superHost:
            return "Superhost"
        }
    }
    
    var subtitle: String {
        switch self {
        case .selfCheckIn:
            return "Check yourself in with the keypad."
        case .superHost:
            return "Superhost are experience, highly rated hosts who are commited to providing great stars for guest."
        }
    }
    
    var id: Int { return self.rawValue }
}

enum ListingAmenities: Int, Codable, Identifiable, Hashable {
    case pool
    case kitchen
    case wifi
    case laundry
    case tv
    case alarmSystem
    case office
    case balcony
    
    var title: String {
        switch self {
            
        case .pool: return "Pool"
        case .kitchen: return "Kitchen"
        case .wifi:  return "Wifi"
        case .laundry: return "Laundry"
        case .tv: return "Tv"
        case .alarmSystem: return "Alram System"
        case .office: return "Office"
        case .balcony: return "Balcony"
        }
    }
    
    var imageName: String {
        switch self {
            
        case .pool: return "figure.pool.swim"
        case .kitchen: return "fork.knife"
        case .wifi: return "wifi"
        case .laundry: return "washer"
        case .tv: return "tv"
        case .alarmSystem: return "shield.checkered"
        case .office: return "pencil.and.ruler.fill"
        case .balcony: return "building"
        }
    }
    
    var id: Int { return self.rawValue }
}

enum ListingType: Int, Codable, Identifiable, Hashable {
    case appartment
    case house
    case townHouse
    case villa
    
    var description: String {
        switch self {
        case .appartment:
            return "Apartment"
        case .house:
            return "House"
        case .townHouse:
            return "Town House"
        case .villa:
            return "Villa"
        }
    }
    
    var id: Int { return self.rawValue }
}
