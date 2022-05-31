//
//  EmojiMemoryGameViewModel.swift
//  Memorize
//
//  Created by Paris G on 5/18/22.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    var emojis =  boatTheme.emojis
    
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

var carTheme = Theme(name: "cars", emojis: ["🚗","🚕","🏎","🚓","🚔","🚘","🚖","🚥"], numOfCardPairs: 8, color: .purple)
var truckTheme = Theme(name: "trucks", emojis: ["🚙","🚌","🚎","🚑","🚒","🚐","🛻","🚚","🚛","🚜","🚍"], numOfCardPairs: 8, color: .red)
var aircraftTheme = Theme(name: "aircraft", emojis: ["✈️","🚀","🚡","🛰","🚁","🛸","🛩","🛬","🛫"], numOfCardPairs: 8, color: .blue)
var cycleTheme = Theme(name: "cycles", emojis: ["🚲","🛵","🏍","🦽","🦼","🛴","🦯","🛺"], numOfCardPairs: 8, color: .green)
var boatTheme = Theme(name: "boats", emojis: ["🛳","⛵️","🛶","🚤","🛥","⛴","🚢","⚓️"], numOfCardPairs: 8, color: .orange)
var trainTheme = Theme(name: "trains", emojis: ["🚉","🚊","🚇","🚆","🚂","🚈","🚅","🚄","🚝","🚞","🚋","🚃","🚟","🚠","🚡"], numOfCardPairs: 8, color: .yellow)

struct Theme {
    var name: String
    var emojis: [String]
    var numOfCardPairs: Int
    var color: UIColor
}
