//
//  SelectCellUITestsWithAutoMate.swift
//  SelectCell
//
//  Created by Joanna Bednarz on 06/04/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import XCTest
import AutoMate

class SelectCellUITestsWithAutoMate: AppUITestCase {

    // MARK: Setup
    override func setUp() {
        super.setUp()
        app.launch()
    }

    // MARK: Test cases
    func testVisibleCellSelection() {
        let tableView = app.tables.element
        let cell = tableView.cells.element(containingLabels: [Locators.title: Locators.titleForRow(at: 2)])

        cell.tap()
        XCTAssertTrue(cell.isSelected)
    }

    func testInvisibleCellSelection() {
        let tableView = app.tables.element
        let cell2 = tableView.cells.element(containingLabels: [Locators.title: Locators.titleForRow(at: 30)])

        cell2.tap()
        XCTAssertTrue(cell2.isSelected)
    }

    func testCellNotSelected() {
        let tableView = app.tables.element
        let cell = tableView.cells.element(containingLabels: [Locators.title: Locators.titleForRow(at: 2)])

        XCTAssertFalse(cell.isSelected)
    }

    func testInvisibleCellNotSelected() {
        let tableView = app.tables.element
        let cell2 = tableView.cells.element(containingLabels: [Locators.title: Locators.titleForRow(at: 30)])
        
        tableView.swipe(to: cell2)
        XCTAssertFalse(cell2.isSelected)
    }
}

enum Locators: String, Locator {
    case title
}

extension Locators {

    static func titleForRow(at number: Int) -> String {
        return "Row No. \(number)"
    }
}
