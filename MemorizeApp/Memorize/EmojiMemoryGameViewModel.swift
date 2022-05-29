//
//  EmojiMemoryGameViewModel.swift
//  Memorize
//
//  Created by Paris G on 5/18/22.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static let emojis = ["🚗","🚕","🏎","🚓","🚔","🚘","🚖","🚥"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in EmojiMemoryGame.emojis[pairIndex] }
    }
 
    //This var is automatically created and assigned under the hood. This is just an example
    //var objectWillChange: ObservedObjectPublisher
    
    //This var is how this viewModel can see the model
    //@Published will automatically updated the view everytime this model changes
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - INTENT
    
    func choose(_ card: MemoryGame<String>.Card ){
        //Need to call this everytime an object changes so UI can be updated automatically or use @Published
//        objectWillChange.send()
        model.choose(card)
    }
}
	
