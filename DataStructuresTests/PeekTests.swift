//
//  HeapTests.swift
//  DataStructures
//
//  Created by Yuri Gorokhov on 11/14/14.
//  Copyright (c) 2014 Yuri Gorokhov. All rights reserved.
//

import Cocoa
import XCTest

class HeapTests: XCTestCase {

    func Heap_peek_returns_nil_when_empty() {
        
        // Arrange
        let h = MinHeap<Int>()
        
        // Assert
        XCTAssertNil(h.Peek(), "peek should have returned nil")
    }
    
    func Heap_peek_returns_minimum() {
        
        // Arrange
        let h = MinHeap<Int>(fromArray: [4,3,2,1])
        
        // Assert
        XCTAssertEqual(1, h.Peek()!, "peek should have returned 1")
    }
}
