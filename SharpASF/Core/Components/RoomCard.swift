//
//  RoomCard.swift
//  SharpASF
//
//  Created by SEAN BLAKE on 1/19/24.
//

import SwiftUI

struct RoomCard: View {
    @State var bedroomCount = 1
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: "bed.double")
            
            Text("Bedroom \(bedroomCount)")
                .fontWeight(.bold)
        }
        .padding(.horizontal, 20)
        .frame(width: 160, height: 110, alignment: .leading)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(lineWidth: 1)
                .foregroundStyle(.secondary)
        )
        
    }
}

#Preview {
    RoomCard()
}
