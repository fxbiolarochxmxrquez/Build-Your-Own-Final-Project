//
//  CardMemoryGame.swift
//  Build Your Own Final Project
//
//  Created by Fabiola Rocha Marquez on 5/6/24.
//

import SwiftUI

class CardMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    private static let images = ["daisy", "donald", "dumbo", "mickey", "minnie", "stitch", "tigger", "winnie"]
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 8) { pairIndex in
            if images.indices.contains(pairIndex) {
                return images[pairIndex]
            } else {
                return ""
            }
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card> {
      model.cards
    }
    
    var color: Color {
        .yellow
    }
    
    var score: Int {
        model.score
    }
    
    //MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: Card) {
        model.choose(card)
    }
}
