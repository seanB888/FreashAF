//
//  CustomPickerView.swift
//  SharpASF
//
//  Created by SEAN BLAKE on 1/19/24.
//

import SwiftUI

struct CustomPickerView: View {
    @State var title = "Who"
    @State var description = "Add a guest"
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundStyle(.secondary)
                Spacer()
                Text(description)
                    .fontWeight(.bold)
            }
            .font(.subheadline)
        }
    }
}

#Preview {
    CustomPickerView()
}
