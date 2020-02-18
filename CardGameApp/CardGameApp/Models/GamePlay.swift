//
//  GamePlay.swift
//  CardGameApp
//
//  Created by Chaewan Park on 2020/02/10.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class GamePlay {
    enum Rule: Int {
        case sevenCardStud = 7
        case fiveCardStud = 5
        
        func invokePerRule(_ block: () -> ()) {
            (0..<rawValue).forEach { _ in block() }
        }
    }
    
    private let dealer = Participant()
    
    private let rule: Rule
    private let players: Players
    private var cardDeck: CardDeck
    
    var participantCount: Int {
        return players.count + 1
    }
    
    init(rule: Rule, numberOfPlayers: Players.Number, cardDeck: CardDeck) {
        self.rule = rule
        self.players = Players(with: numberOfPlayers)
        self.cardDeck = cardDeck
    }
    
    func deal() {
        rule.invokePerRule {
            players.repeatForEachPlayer { $0.take(card: cardDeck.removeOne()) }
            dealer.take(card: cardDeck.removeOne())
        }
    }
    
    func repeatForEachParticipant(_ block: (Participant) -> ()) {
        players.repeatForEachPlayer { block($0) }
        block(dealer)
    }
}