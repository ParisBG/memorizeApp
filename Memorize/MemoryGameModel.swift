//
//  MemoryGame.swift
//  Memorize
//
//  Created by Paris G on 5/18/22.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card> //set means editing is private but anybody can view
    
    mutating func choose(_ card: Card){
        //Toggle is the same as as "toggling" a boolean from true to false.
        let chosenIndex = index(of: card)
        cards[chosenIndex].isFaceUp.toggle()
        print("\(cards)")
    }
    
     func index(of card: Card) -> Int {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return 0 //bogus!
    }
    
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

