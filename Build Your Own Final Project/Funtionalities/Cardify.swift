//
//  Cardify.swift
//  Build Your Own Final Project
//
//  Created by Fabiola Rocha Marquez on 5/12/24.
//

import SwiftUI

struct Cardify: ViewModifier {
    let isFaceUp: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.foregroundColor(.yellow)
                base.strokeBorder(lineWidth: 2)
                content
            }
            .opacity(isFaceUp ? 1 : 0)
            base.foregroundColor(.yellow).opacity(isFaceUp ? 0 : 1)
        }
    }
    
    
}
