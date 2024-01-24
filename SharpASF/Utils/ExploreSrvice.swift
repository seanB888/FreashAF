//
//  ExploreSrvice.swift
//  SharpASF
//
//  Created by SEAN BLAKE on 1/21/24.
//  Mock Service

import Foundation

class ExploreService {
    func fetchListings() async throws -> [Listing] {
        return DeveloperPreview.shared.listings
    }
}
