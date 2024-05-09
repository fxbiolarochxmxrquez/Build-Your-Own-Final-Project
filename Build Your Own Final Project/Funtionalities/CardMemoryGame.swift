//
//  CardMemoryGame.swift
//  Build Your Own Final Project
//
//  Created by Fabiola Rocha Marquez on 5/6/24.
//

import SwiftUI

class CardMemoryGame: ObservableObject {
    private static let images = ["daisy", "donald", "dumbo", "mickey", "minnie", "stitch", "tigger", "winnie"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 8) { pairIndex in
            if images.indices.contains(pairIndex) {
                return images[pairIndex]
            } else {
                return ""
                //do we need this return function?
            }
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    //MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
