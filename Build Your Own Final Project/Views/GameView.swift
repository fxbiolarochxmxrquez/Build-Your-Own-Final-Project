//
//  GameView.swift
//  Build Your Own Final Project
//
//  Created by Keila Islas on 4/22/24.
//

import SwiftUI

struct GameView: View {
    typealias Card = MemoryGame<String>.Card
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
                    ForEach(viewModel.cards) { card in
                        CardView(card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .padding(4)
                            .overlay(FlyingNumber(number: scoreChange(causedBy: card)))
                            .onTapGesture {
                                withAnimation {
                                    viewModel.choose(card)
                                }
                            }
                    }
                }
                HStack {
                    Text("Score: \(viewModel.score)")
                        .animation(nil)
                    Spacer()
                    Button("Shuffle") {
                        withAnimation {
                            viewModel.shuffle()
                        }
                    }
                }
                .padding()
            }
        }
    }
    private func scoreChange(causedBy card: Card) -> Int {
        return 0
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    var body: some View {
        PieCoundownTimer(endAngle: .degrees(240))
            .opacity(0.4)
            .overlay(
                Image(card.content).resizable().cornerRadius(12)
                    .multilineTextAlignment(.center)
                    .padding(5)
            )
            .padding(5)
            .cardify(isFaceUp: card.isFaceUp)
            .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}

#Preview {
    GameView(viewModel: CardMemoryGame())
}
