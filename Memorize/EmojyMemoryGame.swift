//
//  EmojyMemoryGame.swift
//  Memorize
//
//  Created by Sydykov Islam on 4/7/21.
//

import Foundation

class EmojyMemoryGame :ObservableObject {
    
    @Published private var model: MemoryGame<String> = EmojyMemoryGame.createMemoryGame()
    
    private static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻","🎃", "🕷", "⛄️"]
        
        return MemoryGame(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }  
    
    //MARK: - Access to Model
    
    var cards :Array<MemoryGame<String>.Card> {
        model.cards
    }
    //MARK: - Tents
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    func resetGame () {
        model = EmojyMemoryGame.createMemoryGame()
    }
    
}
