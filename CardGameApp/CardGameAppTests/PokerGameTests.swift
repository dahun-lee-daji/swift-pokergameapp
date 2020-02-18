//
//  PokerGameTest.swift
//  CardGameAppTests
//
//  Created by kimdo2297 on 2020/02/15.
//  Copyright © 2020 Jason. All rights reserved.
//
import XCTest
@testable import CardGameApp
class PokerGameTests: XCTestCase {
    var game: PokerGame!
    let correctStutNum = 5
    let correctPlayersNum = 1
    
    override func tearDown() {
        game = nil
        super.tearDown()
    }
    
    func testInitiateForGameStutNumber() {
        // wrong cases
        let wrongNumber = 3
        game = try? PokerGame(gameStutNumber: wrongNumber,
                              playersNumber: correctPlayersNum)
        XCTAssertNil(game)
        
        
        // correct cases
        let correctNumberFive = 5
        game = try? PokerGame(gameStutNumber: correctNumberFive,
                              playersNumber: correctPlayersNum)
        XCTAssertNotNil(game)
        
        let correctNumberSeven = 7
        game = try? PokerGame(gameStutNumber: correctNumberSeven,
                              playersNumber: correctPlayersNum)
        XCTAssertNotNil(game)
    }
    
    
    
    func testInitateForPlayersNumber() {
        // wrong cases
        let wrongNumberZero = 0
        game = try? PokerGame(gameStutNumber: correctStutNum,
                              playersNumber: wrongNumberZero)
        XCTAssertNil(game)
        
        let wrongNumberFive = 5
        game = try? PokerGame(gameStutNumber: correctStutNum,
                              playersNumber: wrongNumberFive)
        XCTAssertNil(game)
        
        // correct cases
        for num in 1 ..< wrongNumberFive {
            game = try? PokerGame(gameStutNumber: correctStutNum,
                                  playersNumber: num)
            XCTAssertNotNil(game)
        }
    }
    
    func testStartNewRound() {
        //1. given
        let stutNum = 5
        let playerNum = 3
        let dealerCount = 1
        game = try! PokerGame(gameStutNumber: stutNum, playersNumber: playerNum)
        var originDeck = [Card]()
        game.searchDeck { (deck : Deck) in
            deck.searchCard {
                originDeck.append($0)
            }
        }
        
        //2. when
        try! game.startNewRound()
        
        //3. then
        var handedOutCards = [Card]()
        game.searchDealer { (dealer: Player) in
            dealer.searchCard {
                handedOutCards.append($0)
            }
        }
        game.searchPlayers { (player : Player) in
            player.searchCard {
                handedOutCards.append($0)
            }
        }
        XCTAssertEqual(handedOutCards.count, stutNum * (playerNum + dealerCount))
        game.searchDeck { (remainedDeck: Deck) in
            XCTAssertEqual(remainedDeck.count , originDeck.count - handedOutCards.count)
        }
    }
    
    func testHasEnoughCards() {
        //1. given
        let seven = 7
        let four = 4
        game = try! PokerGame(gameStutNumber: seven, playersNumber: four)
        
        //2. when
        try! game.startNewRound() // remainedCards = 52 - 7 * 5 ( one is dealer) = 17
        
        //3. then
        XCTAssertFalse(game.hasEnoughCards())
    }
    
}