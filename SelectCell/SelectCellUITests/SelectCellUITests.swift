//
//  SelectCellUITests.swift
//  SelectCellUITests
//
//  Created by Joanna Bednarz on 06/04/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import XCTest

class SelectCellUITests: XCTestCase {

    var app: XCUIApplication!
    // MARK: Setup
    override func setUp() {
        super.setUp()

        app = XCUIApplication()
        app.launch()
    }

    // MARK: Test cases
    func testVisibleCellSelection() {
        let tableView = app.tables.element
        let cell = tableView.cells.element(boundBy: 2)

        cell.tap()
        XCTAssertTrue(cell.isSelected)
    }

    func testInvisibleCellSelection() {
        let tableView = app.tables.element
        let cell = tableView.cells.element(boundBy: 30)

        cell.tap()
        XCTAssertTrue(cell.isSelected)
    }

    func testCellNotSelected() {
        let tableView = app.tables.element
        let cell = tableView.cells.element(boundBy: 2)

        XCTAssertFalse(cell.isSelected)
    }

    func testInvisibleCellNotSelected() {
        let tableView = app.tables.element
        let cell = tableView.cells.element(boundBy: 30)

        XCTAssertFalse(cell.exists && cell.isHittable)
        // Will fail cause XCTest won't scroll to the cell without action so selection can't be checked.
//        XCTAssertFalse(cell.isSelected)
    }
    
}
