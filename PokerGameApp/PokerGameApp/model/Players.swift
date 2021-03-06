//
//  Players.swift
//  PokerGameApp
//
//  Created by 이다훈 on 2021/02/19.
//

import Foundation

class Players {
    private var players : [Player]
    
    init(howManyPlayer playerCount : Int) {
        self.players = []
        for index in 0..<playerCount {
            self.players.append(Player.init(name: String(index)))
        }
    }
    
    func selectPlayer(who playerNumber : Int) -> Player {
        return players[playerNumber]
    }
    
    func allPlayers() -> [Player] {
        return players
    }
    
    func resetSelf() {
        for player in players {
            player.resetSelf()
        }
    }
    
    func printInfo( do closure : ((Player) -> Void)) {
        for player in players {
            player.printInfo(do: closure)
        }
    }
}
