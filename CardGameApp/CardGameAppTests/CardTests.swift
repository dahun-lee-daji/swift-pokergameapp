//
//  CardTests.swift
//  CardGameAppTests
//
//  Created by Viet on 2020/02/10.
//  Copyright © 2020 Viet. All rights reserved.
//

import XCTest

class CardTests: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }

    func testExample() {
        let card = Card(suit: .heart, rank: .king)
        XCTAssertEqual(card.description, "♥️ K")
        
        let card2 = Card(suit: .spade, rank: .ten)
        XCTAssertEqual(card2.description, "♠️ 10")
    }
}