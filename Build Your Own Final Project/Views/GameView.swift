//
//  GameView.swift
//  Build Your Own Final Project
//
//  Created by Keila Islas on 4/22/24.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var viewModel: CardMemoryGame
    var body: some View {
        ZStack {
            Color.red.opacity(0.9).ignoresSafeArea()
            VStack {
                Text("4x4")
                    .font(Font.custom("Marker Felt", size: 35))
                Text("Disney Characters")
                    .font(Font.custom("Marker Felt", size: 20))
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 88), spacing: 0)], spacing: 0) {
                    ForEach(viewModel.cards.indices, id: \.self) { index in
                        CardView(viewModel.cards[index])
                            .aspectRatio(2/3, contentMode: .fit)
                            .padding(4)
                    }
                }
                Button("Shuffle") {
                    viewModel.shuffle()
                }
            }
        }
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.foregroundColor(.yellow)
                base.strokeBorder(lineWidth: 2)
                Image(card.content).resizable().cornerRadius(12)
                    .padding()
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.foregroundColor(.yellow).opacity(card.isFaceUp ? 0 : 1)
        }
    }
}

#Preview {
    GameView(viewModel: CardMemoryGame())
}

