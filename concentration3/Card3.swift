//
//  Card3.swift
//  concentration3
//
//  Created by SS on 11/02/2018.
//  Copyright © 2018 SS. All rights reserved.
//

import Foundation

struct Card : Hashable {
    var hashValue: Int {return identifier}
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var isFaceUp = false
    var isMatched = false
    private var identifier: Int
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
}



