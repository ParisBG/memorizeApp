//
//  MemoryGame.swift
//  Memorize
//
//  Created by Paris G on 5/18/22.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card> //set means editing is private but anybody can view
    
    func choose(_ card: Card){
        
    } //using external naming here
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent){
        cards = Array<Card>()
        //Add numberOfPairsOfCards x 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = createCardContent(pairIndex) //Function as a variable that will create card content
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
 
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent //Generic Type
        var id: Int

    }
}

