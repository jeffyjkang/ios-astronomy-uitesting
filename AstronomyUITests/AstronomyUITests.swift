//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Jeff Kang on 1/23/21.
//  Copyright © 2021 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    func testCollectionView() {
        let app = XCUIApplication()
        app.launch()
        XCTAssert(app.buttons["PhotosCollectionViewController.PreviousSolButton"].exists)
        XCTAssert(app.buttons["PhotosCollectionViewController.NextSolButton"].exists)
        XCTAssert(app.navigationBars["Sol 1"].exists)
        XCTAssert(app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.exists)
    }
    
    func testNextSolTitle() {
        let app = XCUIApplication()
        app.launch()
        app.navigationBars["Sol 1"].buttons["PhotosCollectionViewController.NextSolButton"].tap()
        
        let navBar = app.navigationBars["Sol 2"]
        XCTAssert(navBar.staticTexts["Sol 2"].exists)
    }
    
    func testDetailView() {
        let app = XCUIApplication()
        app.launch()
        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        XCTAssert(app.images["PhotoDetailViewController.ImageView"].exists)
        XCTAssert(app.buttons["PhotoDetailViewController.SaveButton"].exists)
    }

    func testPhotoSave() {
        let app = XCUIApplication()
        app.launch()
        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        app.buttons["PhotoDetailViewController.SaveButton"].tap()
        XCTAssert(app.alerts["Photo Saved!"].exists)
        app.alerts["Photo Saved!"].scrollViews.otherElements.buttons["Okay"].tap()
    }
        
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
                
//        let app = XCUIApplication()
//        app.navigationBars["Sol 1"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
//        let app = XCUIApplication()
//        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
//        app/*@START_MENU_TOKEN@*/.staticTexts["Save to Photo Library"]/*[[".buttons[\"Save to Photo Library\"].staticTexts[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"].staticTexts[\"Save to Photo Library\"]",".staticTexts[\"Save to Photo Library\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        app.alerts["Photo Saved!"].scrollViews.otherElements.buttons["Okay"].tap()
//        app.navigationBars["Title"].buttons["Sol 1"].tap()
                
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
