//
//  Heap.swift
//  Heap
//
//  Created by Yuri Gorokhov on 11/13/14.
//  Copyright (c) 2014 Yuri Gorokhov. All rights reserved.
//

import Foundation

private extension Int {
    func Parent() -> Int {
        return Int(floor(Double(self) / 2.0))
    }
    
    func LeftChild() -> Int {
        return 2*self
    }
    
    func RightChild() -> Int {
        return 2*self + 1
    }
}

public class MinHeap<T: Comparable> {
    
    //--- Variables ---
    private var _dataArray: [T] = []
    
    //--- Properties ---
    public var isEmpty: Bool {
        get {
            return _dataArray.isEmpty
        }
    }
    
    //--- Init ---
    init(fromArray array: [T]) {
        for elem in array {
            Insert(elem)
        }
    }
    
    convenience init() {
        self.init(fromArray: [T]())
    }
    
    //--- Methods ---
    public func Insert(item: T) {
        _dataArray.append(item)
        HeapUp(_dataArray.count - 1)
    }
    
    public func Peek() -> T? {
        if _dataArray.isEmpty {
            return nil
        }
        return _dataArray[0];
    }
    
    public func Size() -> Int {
        return _dataArray.count
    }
    
    public func ExtractMin() -> T? {
        if _dataArray.isEmpty {
            return nil
        }
        let min = _dataArray[0]
        _dataArray[0] = _dataArray[_dataArray.count - 1]
        _dataArray.removeAtIndex(_dataArray.count - 1)
        HeapDown(0)
        return min
    }
    
    private func HeapUp(i: Int) {
        let parent = i.Parent()
        if _dataArray[i] < _dataArray[parent] {
            Swap(i, with: parent)
            HeapUp(parent)
        }
    }
    
    private func HeapDown(i: Int) {
        var left = i.LeftChild()
        var right = i.RightChild()
        if right < _dataArray.count {
            
            // both left and right child exist
            if _dataArray[i] > min(_dataArray[left], _dataArray[right]) {
                if _dataArray[left] < _dataArray[right] {
                    Swap(i, with: left)
                    HeapDown(left)
                } else {
                    Swap(i, with: right)
                    HeapDown(right)
                }
            }
        } else if left < _dataArray.count && _dataArray[i] > _dataArray[left] {
            
            // only left child exists
            Swap(i, with: left)
            HeapDown(left)
        }
    }
    
    private func Swap(i: Int, with j: Int) {
        let tmp = _dataArray[i]
        _dataArray[i] = _dataArray[j]
        _dataArray[j] = tmp;
    }
}