//
//  ViewController.swift
//  concentration3
//
//  Created by SS on 10/02/2018.
//  Copyright © 2018 SS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1 ) / 2)
    
    private(set) var flipCount = 0 {
        didSet {
        flipCountLabel.text = "Flips: \(flipCount)"
        }
    }

    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("no such card")
        }
    } 

    private func updateViewFromModel() {
        for  index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji (for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0): #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            }
        }
    }
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    @IBOutlet private var cardButtons: [UIButton]!
    
    private var emojiChoises = "🐨🦁🐸🐝🐣🐳🐯🦆🐹🐰🦊🐼"
    private var emoji = [Card: String] ()
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, emojiChoises.count > 0 {
            let randomStringIndex = emojiChoises.index(emojiChoises.startIndex, offsetBy: emojiChoises.count.arc4random)
            emoji[card] = String(emojiChoises.remove(at: randomStringIndex))
        }
        return emoji[card] ?? "?" // !!!!!
    }
    
    
}

