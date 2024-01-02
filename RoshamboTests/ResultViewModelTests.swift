//
//  ResultViewModelTests.swift
//  RoshamboTests
//
//  Created by Lucas Lopes on 02/01/24.
//

import XCTest
@testable import Roshambo

class ResultViewModelTests: XCTestCase {
    var viewModel: ResultViewModel!

    override func setUp() {
        super.setUp()
        viewModel = ResultViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testMessageForMatch() {
        let match = RPSMatch(p1: .rock, p2: .scissors) // Assuming you have a constructor like this
        let message = viewModel.messageForMatch(match)
        XCTAssertEqual(message, "Rock crushes Scissors. You Win!")
    }

    func testResultString() {
        let match = RPSMatch(p1: .rock, p2: .scissors)
        let result = viewModel.resultString(match)
        XCTAssertEqual(result, "You Win!")
    }

    func testVictoryModeString() {
        let victoryMode = viewModel.victoryModeString(RPS.rock)
        XCTAssertEqual(victoryMode, "crushes")
    }

    func testImageForMatch() {
        let match = RPSMatch(p1: .rock, p2: .scissors)
        let imageName = viewModel.imageForMatch(match)
        XCTAssertEqual(imageName, "RockCrushesScissors")
    }
}

