//
//  GameView.swift
//  Build Your Own Final Project
//
//  Created by Keila Islas on 4/22/24.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var viewModel: CardMemoryGame
    typealias Card = MemoryGame<String>.Card
    private let aspectRatio: CGFloat = 2/3
    private let spacing: CGFloat = 4
    private let dealAnimation: Animation = .easeInOut(duration: 1)
    private let dealInterval: TimeInterval = 0.15
    private let deckWidth: CGFloat = 50
    var body: some View {
        ZStack {
            Color.red.opacity(0.9).ignoresSafeArea()
            VStack {
                Text("4x4")
                    .font(Font.custom("Marker Felt", size: 35))
                Text("Disney Characters")
                    .font(Font.custom("Marker Felt", size: 20))
                cards.foregroundColor(viewModel.color)
                HStack {
                    score
                    Spacer()
                    deck.foregroundColor(viewModel.color)
                    Spacer()
                    shuffle
                }
                .padding()
            }
        }
    }
    
    private var score: some View {
        Text("Score: \(viewModel.score)")
            .animation(nil)
    }
    
    private var shuffle: some View {
        Button("Shuffle") {
            withAnimation {
                viewModel.shuffle()
            }
        }
    }
    
    private var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 88), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards) { card in
                if isDealt(card) {
                    view(for: card)
                        .aspectRatio(aspectRatio, contentMode: .fit)
                        .padding(spacing)
                        .overlay(FlyingNumber(number: scoreChange(causedBy: card)))
                        .zIndex(scoreChange(causedBy: card) != 0 ? 100 : 0)
                        .onTapGesture {
                           choose(card)
                        }
                }
            }
        }
    }
    
    private func view(for card: Card) -> some View {
        CardView(card)
            .matchedGeometryEffect(id: card.id, in: dealingNamespace)
            .transition(.asymmetric(insertion: .identity, removal: .identity))
    }
    
    private func choose(_ card: Card) {
        withAnimation {
            let scoreBeforeChoosing = viewModel.score
            viewModel.choose(card)
            let scoreChange = viewModel.score - scoreBeforeChoosing
            lastScoreChange = (scoreChange, causedByCardId: card.id)
        }
    }
    
    @State private var lastScoreChange = (0, causedByCardId: "")
    
    private func scoreChange(causedBy card: Card) -> Int {
        let (amount, id) = lastScoreChange
        return card.id == id ? amount : 0
    }
    
    // MARK: - Dealing from a deck
    
    @State private var dealt = Set<Card.ID>()
    
    private func isDealt(_ card: Card) -> Bool {
        dealt.contains(card.id)
    }
    private var undealtCards: [Card] {
        viewModel.cards.filter { !isDealt($0) }
    }
    
    @Namespace private var dealingNamespace
    
    private var deck: some View {
        ZStack {
            ForEach(undealtCards) { card in
                view(for: card)
            }
        }
        .frame(width: deckWidth, height: deckWidth / aspectRatio)
        .onTapGesture {
            deal()
        }
    }
    
    private func deal() {
        var delay: TimeInterval = 0
        for card in viewModel.cards {
            withAnimation(dealAnimation.delay(delay)) {
                _ = dealt.insert(card.id)
            }
            delay += dealInterval
        }
    }
}

struct CardView: View {
    typealias Card = MemoryGame<String>.Card
    let card: Card
    init(_ card: Card) {
        self.card = card
    }
    var body: some View {
        TimelineView(.animation) { timeline in
            if card.isFaceUp || !card.isMatched {
                PieCoundownTimer(endAngle: .degrees(card.bonusPercentRemaining * 360))
                    .opacity(0.5)
                    .overlay(cardContents.padding(5))
                    .padding(5)
                    .cardify(isFaceUp: card.isFaceUp)
                    .transition(.scale)
            } else {
                Color.clear
            }
        }
    }
    
    var cardContents: some View {
        Image(card.content).resizable().cornerRadius(12)
            .multilineTextAlignment(.center)
            .padding(5)
    }
}

#Preview {
    GameView(viewModel: CardMemoryGame())
}
