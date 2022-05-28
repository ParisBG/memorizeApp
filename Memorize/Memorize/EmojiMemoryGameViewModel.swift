//
//  EmojiMemoryGameViewModel.swift
//  Memorize
//
//  Created by Paris G on 5/18/22.
//

import SwiftUI

class EmojiMemoryGame {
    static let emojis = ["🚗","🚕","🏎","🚓","🚔","🚘","🚖","🚥"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in EmojiMemoryGame.emojis[pairIndex] }
    }
 
    //This var is how this viewModel can see the model
    private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
