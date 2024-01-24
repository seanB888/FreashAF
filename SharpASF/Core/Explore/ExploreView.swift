//
//  ExploreView.swift
//  SharpASF
//
//  Created by SEAN BLAKE on 1/18/24.
//

import SwiftUI

struct ExploreView: View {
    @State private var showDestinationSearchView = false
    @StateObject var vm = ExploreViewModel(service: ExploreService())
    
    var body: some View {
        NavigationStack {
            if showDestinationSearchView {
                DestinationSearchView(show: $showDestinationSearchView)
            } else {
                ScrollView {
                    // MARK: -Search box
                    SearchAndFilterBar()
                        .onTapGesture {
                            withAnimation(.snappy) {
                                showDestinationSearchView.toggle()
                            }
                        }
                    // MARK: - List view
                    LazyVStack(spacing: 32) {
                        ForEach(vm.listings) { listing in
                            NavigationLink(value: listing) {
                                ListingItemView(listing: listing)
                            }
                        }
                    }
                    .padding()
                }
                .navigationDestination(for: Listing.self) { listing in
                    ListingDetailView(listing: listing)
                        .navigationBarBackButtonHidden()
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
