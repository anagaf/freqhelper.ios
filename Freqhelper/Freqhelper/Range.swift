//
//  Range.swift
//  Freqhelper
//
//  Created by Andrey Agafonov on 24/10/15.
//  Copyright © 2015 anagaf. All rights reserved.
//

import Foundation

protocol Range {
    
    var values : Array<UInt64> { get }
    
    var name : String { get }
}

extension Range {
    
    func find (value : UInt64) -> Int? {
        return self.values.indexOf({$0 == value});
    }
    
    func findPrev (valueToFind : UInt64) -> Int? {
        var resultIndex : Int? = nil
        for (index, value) in self.values.enumerate() {
            if (value < valueToFind) {
                resultIndex = index
            } else {
                break
            }
        }
        return resultIndex;
    }
    
    func findNext (valueToFind : UInt64) -> Int? {
        var resultIndex : Int? = nil
        for (index, value) in self.values.enumerate().reverse() {
            if (value > valueToFind) {
                resultIndex = index
            } else {
                break
            }
        }
        return resultIndex;
    }
    
}