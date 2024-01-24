//
//  ButtonModifier.swift
//  SharpASF
//
//  Created by SEAN BLAKE on 1/20/24.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
    var buttonHeight: CGFloat = 44
    var buttonCorner: CGFloat = 8
    var backgroundColor: Color = .pink
    var foregroundColor: Color = .white
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(foregroundColor)
            .font(.subheadline)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity)
            .frame(height: buttonHeight)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: buttonCorner))
    }
}
