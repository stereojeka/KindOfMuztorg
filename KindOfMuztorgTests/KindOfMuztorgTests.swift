//
//  KindOfMuztorgTests.swift
//  KindOfMuztorgTests
//
//  Created by Евгений Нименко on 11.11.2020.
//  Copyright © 2020 Yevhen Nimenko. All rights reserved.
//

import XCTest
@testable import KindOfMuztorg

class KindOfMuztorgTests: XCTestCase {
    
    var testableEnvironmentObject = UserData()
    
    override class func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }

    func testProductsParse() {
        let testedProducts = testableEnvironmentObject.products
        let hotProducts = testableEnvironmentObject.products.filter { $0.isHotProduct }
        XCTAssertEqual(testedProducts.count, 13)
        XCTAssertEqual(hotProducts.count, 10)
        XCTAssertEqual(testableEnvironmentObject.basket.count, 0)
    }
}
