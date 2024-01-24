//
//  ExploreViewModel.swift
//  SharpASF
//
//  Created by SEAN BLAKE on 1/21/24.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var listings = [Listing]()
    private let service: ExploreService
    
    init(service: ExploreService) {
        self.service = service
        
        Task { await fetchListings() }
    }
    
    func fetchListings() async {
        do {
            self.listings = try await service.fetchListings()
        } catch {
            print("DEBUG: Fail to fetch listings with error: \(error.localizedDescription)")
        }
    }
}
