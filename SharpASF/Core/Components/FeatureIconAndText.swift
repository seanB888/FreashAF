//
//  FeatureIconAndText.swift
//  SharpASF
//
//  Created by SEAN BLAKE on 1/19/24.
//

import SwiftUI

struct FeatureIconAndText: View {
    @State var featureIcon = "door.left.hand.open"
    @State var titleText = "Self Check-in"
    @State var descriptionText = "Check Yourself in with the keypad."
    
    var body: some View {
        HStack {
            Image(systemName: featureIcon)
            VStack(alignment: .leading) {
                Text(titleText)
                    .fontWeight(.bold)
                Text(descriptionText)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    FeatureIconAndText()
}
