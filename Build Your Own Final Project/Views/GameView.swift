//
//  GameView.swift
//  Build Your Own Final Project
//
//  Created by Keila Islas on 4/22/24.
//

import SwiftUI

struct GameView: View {
    var viewModel: CardMemoryGame = CardMemoryGame()
    let images = ["daisy", "donald", "dumbo", "mickey", "minnie", "stitch", "tigger", "winnie"]
    var body: some View {
        ZStack {
            Color.red.opacity(0.9).ignoresSafeArea()
            VStack {
                Text("4x4")
                    .font(Font.custom("Marker Felt", size: 35))
                Text("Disney Characters")
                    .font(Font.custom("Marker Felt", size: 20))
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 88))]) {
                    ForEach(images.indices, id: \.self) { index in
                        CardView(content: images[index])
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
        }
    }
}

struct CardView: View {
    let content: String
    @State private var isFaceUp = true
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.foregroundColor(.yellow)
                base.strokeBorder(lineWidth: 2)
                Image(content).resizable().cornerRadius(12)
                    .padding()
            }
            .opacity(isFaceUp ? 1 : 0)
            base.foregroundColor(.yellow).opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    GameView()
}

