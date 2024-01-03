//
//  RpsViewModelTests.swift
//  RoshamboTests
//
//  Created by Lucas Lopes on 03/01/24.
//

import XCTest
@testable import Roshambo

final class RpsViewModelTests: XCTestCase {
    var viewModel: RpsViewModel!

    override func setUp() {
        super.setUp()
        viewModel = RpsViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testMakeYourMove() {
        let playersMove = RPS.paper
        viewModel.makeYourMove(playersMove)

        // Test showingModal
        XCTAssertTrue(viewModel.showingModal)

        // Test matchResult
        XCTAssertNotNil(viewModel.matchResult)
        XCTAssertEqual(viewModel.matchResult?.p1, playersMove)

        // Test history
        XCTAssertFalse(viewModel.history.isEmpty)
        XCTAssertEqual(viewModel.history.first?.p1, playersMove)
    }
}
