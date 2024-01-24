//
//  WishlistView.swift
//  SharpASF
//
//  Created by SEAN BLAKE on 1/20/24.
//

import SwiftUI

struct WishlistView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 32) {
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Log in to view your wishlist.")
                        .font(.headline)
                    
                    Text("You can view or edit your wishlist when you are logged in.")
                        .font(.footnote)
                }
                    // MARK: - Log in button
                    Button(action: {
                        // action...
                    }, label: {
                        Text("Log in")
                            .modifier(ButtonModifier(buttonHeight: 44, buttonCorner: 8, backgroundColor: .pink, foregroundColor: .white))
                    })
                Spacer()
            }
            .padding()
            .navigationTitle("Wishlist")
        }
    }
}

#Preview {
    WishlistView()
}
