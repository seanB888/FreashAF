//
//  CustomViewModifier.swift
//  SharpASF
//
//  Created by SEAN BLAKE on 1/20/24.
//

import SwiftUI

struct CustomViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
    }
}
