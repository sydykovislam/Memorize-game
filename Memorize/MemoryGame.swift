//
//  MemoryGame.swift
//  Memorize
//
//  Created by Sydykov Islam on 4/6/21.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    
    private(set) var cards: Array<Card>
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            let faceUpCardsIndices = cards.indices.filter { index -> Bool in
                return cards[index].isFaceUp
            }
            return faceUpCardsIndices.only
//            for index in cards.indices {
//                if cards[index].isFaceUp {
//                    faceUpCardsIndices.append(index)
//                }
//            }
            
//            if faceUpCardsIndices.count == 1 {
//                return faceUpCardsIndices.first
//            } else {
//                return nil
//            } --> replaced by .only
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
//                if index == newValue {
//                    cards[index].isFaceUp = true
//                } else {
//                    cards[index].isFaceUp = false
//                }
            }
        }
    }
    
    mutating func choose(card: Card) {
        
        if let chosenCardIndex = cards.getFirstIndex(matching: card), !cards[chosenCardIndex].isFaceUp, !cards[chosenCardIndex].isMatched {
            
            if let potentialMatchIndex = indexOfOneAndOnlyFaceUpCard {
                if cards[chosenCardIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenCardIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                //indexOfOneAndOnlyFaceUpCard = nil
                self.cards[chosenCardIndex].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = chosenCardIndex
            }
            
         
        }
        
        
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex * 2, content: content))
            cards.append(Card(id: pairIndex * 2 + 1, content: content))
        }
        cards.shuffle()
    }
    
//    mutating func shuffle() {
//        let amountOfCards = cards.count
//        var counter = amountOfCards
//        var randomIndices = [Int]()
//        var shuffledCards = Array<Card>()
//
//        while counter != 0 {
//            var success = false
//            while success {
//                let newRandomIndex = Int.random(in: 0..<amountOfCards)
//                if !randomIndices.contains(newRandomIndex) {
//                    randomIndices.append(newRandomIndex)
//                    counter -= 1
//                    success = true
//                }
//            }
//        }
//
//        for index in randomIndices {
//            shuffledCards.append(cards[index])
//        }
//
//        cards = shuffledCards
//
//    }
    
    struct Card: Identifiable {
        var id :Int
        var isFaceUp :Bool = false
        var isMatched :Bool = false
        var content: CardContent
    }
}
