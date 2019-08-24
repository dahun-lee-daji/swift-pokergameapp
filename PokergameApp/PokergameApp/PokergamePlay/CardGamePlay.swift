//
//  CardGamePlay.swift
//  PokergameApp
//
//  Created by hw on 22/08/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import Foundation


struct CardGamePlay {
    var dealer = Dealer.init()
    var players: [Playable] = [Playable]()
    var gameType : GameType
    var playerCount: PlayerType
    
    func playGame() -> GameWinner? {
        players.forEach { (player) in
            player.resetHand()
        }
        dealer.distributeCards(players, gameType: gameType)
        guard let winner = GameResult.init(players)?.selectWinnerName() else {
            return nil
        }
        return winner
    }
    
    init(number: PlayerType = PlayerType.two, gameType: GameType = GameType.sevenCard){
        self.playerCount = number
        self.gameType = gameType
        for index in 1..<playerCount.rawValue {
            let player = Player.init("Player\(index)")
            players.append(player)
        }
        players.append(dealer)
    }
}