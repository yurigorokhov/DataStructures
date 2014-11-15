//
//  ExtractMinTests.swift
//  DataStructures
//
//  Created by Yuri Gorokhov on 11/14/14.
//  Copyright (c) 2014 Yuri Gorokhov. All rights reserved.
//

import Cocoa
import XCTest

class ExtractMinTests: XCTestCase {

    func ExtractMin_returns_minimum() {

        // Arrange
        var h = MinHeap<Int>(fromArray: [4,3,2,1])

        // Assert
        var previous: Int?
        while !h.isEmpty {
            let min = h.ExtractMin()
            if let prev = previous {
                XCTAssertGreaterThanOrEqual(min!, prev, "Values are coming back out of order")
            }
            previous = min
        }
    }
    
    func ExtractMin_random_heap() {
        
        // Arrange
        var h = MinHeap<Int>()
        for val in 10000...1 {
            h.Insert(val)
        }
        
        // Assert
        var previous: Int?
        while !h.isEmpty {
            let min = h.ExtractMin()
            if let prev = previous {
                XCTAssertGreaterThanOrEqual(min!, prev, "Values are coming back out of order")
            }
            previous = min
        }
    }
}
