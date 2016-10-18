//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Arkadiusz Żmudzin on 12.10.2016.
//  Copyright © 2016 Arkadiusz Żmudzin. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    
    // MARK: FoodTracker Tests
    
    func testMealInitialization() {
        // success case
        let potentialItem = Meal(name: "Newest meal", photo: nil, rating: 5)
        XCTAssertNotNil(potentialItem)
        
        // failure cases
        let noName = Meal(name: "", photo: nil, rating: 0)
        XCTAssertNil(noName)
        
        let badRating = Meal(name: "name", photo: nil, rating: -1)
        XCTAssertNil(badRating)
    }
}
