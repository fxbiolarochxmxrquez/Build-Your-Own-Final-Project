//
//  GameView.swift
//  Build Your Own Final Project
//
//  Created by Keila Islas on 4/22/24.
//

import SwiftUI

struct GameView: View {
    var isFaceUp: Bool = false
    var body: some View {
        ZStack {
            Color.red.opacity(0.9).ignoresSafeArea()
            VStack {
                Text("4x4")
                    .font(Font.custom("Marker Felt", size: 35))
                Text("Disney Characters")
                    .font(Font.custom("Marker Felt", size: 20))
                Spacer()
                ZStack(content: {
                    if isFaceUp {
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundColor(.yellow)
                        RoundedRectangle(cornerRadius: 12)
                            .strokeBorder(lineWidth: 2)
                        Image("mickey").resizable().cornerRadius(12)
                            .padding()
                    } else {
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundColor(.yellow)
                    }
                })
            }
        }
    }
}

#Preview {
    GameView()
}

