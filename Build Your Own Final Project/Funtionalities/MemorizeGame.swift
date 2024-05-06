//
//  MemorizeGame.swift
//  Build Your Own Final Project
//
//  Created by Fabiola Rocha Marquez on 5/6/24.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    func choose(card: Card) {
        
    }
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
