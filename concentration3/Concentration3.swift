//
//  Concentration3.swift
//  concentration3
//
//  Created by SS on 11/02/2018.
//  Copyright © 2018 SS. All rights reserved.
//

import Foundation

struct Concentration {
    
    var cards = [Card]()
    
    mutating func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Not in the cards")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index //сохраняем ее индекс в "единственной карте"
            }
        }
    }
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get{
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        
        set (newValue) {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
        
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "at least one pair.")
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards.insert(card, at: cards.count.arc4random)
            cards.insert(card, at: cards.count.arc4random)
        }
        
        // TODO: Shuffle the cards
    }
    
    
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if  self < 0 {
            return -Int(arc4random_uniform(UInt32(self)))
        } else {
            return 0
        }
    }
}
