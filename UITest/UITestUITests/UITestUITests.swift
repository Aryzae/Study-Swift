//
//  UITestUITests.swift
//  UITestUITests
//
//  Created by Aryzae on 2017/05/21.
//  Copyright © 2017年 Aryzae. All rights reserved.
//

import XCTest
@testable import UITest

class UITestUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let app = XCUIApplication()

        // AccecibilityIDが該当するObjectを取得
        let calcLabel = app.staticTexts["calcLabel"]        // UILabel
        let lhsTextField = app.textFields["lhsTextField"]   // UITextField
        let rhsTextField = app.textFields["rhsTextField"]   // UITextField
        let addButton = app.buttons["addButton"]            // UIButton

        // 操作
        lhsTextField.tap()          // タップ
        lhsTextField.typeText("6")  // 6入れる

        rhsTextField.tap()          // タップ
        rhsTextField.typeText("7")  // 9入れる

        XCTAssertTrue(addButton.isEnabled)  // addButtonが有効なことを確認

        addButton.tap()             // タップ
        XCTAssertEqual(calcLabel.label, "13")   // calcLabelの表示が13か確認
    }

    func testExample2() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        // AccecibilityIDが該当するObjectを取得
        let calcLabel = app.staticTexts["calcLabel"]        // UILabel
        let lhsTextField = app.textFields["lhsTextField"]   // UITextField
        let rhsTextField = app.textFields["rhsTextField"]   // UITextField
        let multiplyButton = app.buttons["multiplyButton"]  // UIButton

        // 操作
        lhsTextField.tap()          // タップ
        lhsTextField.typeText("4")  // 6入れる

        rhsTextField.tap()          // タップ
        rhsTextField.typeText("9")  // 9入れる

        XCTAssertTrue(multiplyButton.isEnabled)  // addButtonが有効なことを確認

        multiplyButton.tap()             // タップ
        XCTAssertEqual(calcLabel.label, "36")   // calcLabelの表示が36か確認
    }

    func testHogeAdd() {
        let hoge = Hoge()
        let addValue = hoge.add(a: 2, b: 3)
        XCTAssertEqual(addValue, 5)
    }

    func testFugeMultiply() {
        let fuga = Fuga()
        let multiplyValue = fuga.multiply(a: 2, b: 3)
        XCTAssertEqual(multiplyValue, 6)
    }

}
