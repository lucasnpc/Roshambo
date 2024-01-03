//
//  ResultViewModelTest.swift
//  RoshamboTests
//
//  Created by Lucas Lopes on 03/01/24.
//

import XCTest
@testable import Roshambo

class HistoryViewModelTests: XCTestCase {
    var viewModel: HistoryViewModel!

    override func setUp() {
        super.setUp()
        viewModel = HistoryViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testMatchInfo() {
        // Test for Tie
        var rpsMatch = RPSMatch(p1: .rock, p2: .rock)
        var result = viewModel.matchInfo(rpsMatch: rpsMatch)
        XCTAssertEqual(result, "Tie.")

        // Test for Win
        rpsMatch = RPSMatch(p1: .rock, p2: .scissors)
        result = viewModel.matchInfo(rpsMatch: rpsMatch)
        XCTAssertEqual(result, "Win!")

        // Test for Loss
        rpsMatch = RPSMatch(p1: .paper, p2: .scissors)
        result = viewModel.matchInfo(rpsMatch: rpsMatch)
        XCTAssertEqual(result, "Loss.")
    }
}

