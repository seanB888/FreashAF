//
//  IconAndText.swift
//  SharpASF
//
//  Created by SEAN BLAKE on 1/19/24.
//

import SwiftUI

struct IconAndText: View {
    @State var icon = "wifi"
    @State var title = "Wifi"
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: icon)
            
            Text(title)
                .fontWeight(.bold)
        }
    }
}

#Preview {
    IconAndText()
}
