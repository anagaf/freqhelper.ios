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
    
    func find (value : UInt64) -> Int {
        let index = self.values.indexOf({$0 == value});
        if (index == nil) {
            return NSNotFound;
        }
        return index!;
    }
    
    func findPrev (valueToFind : UInt64) -> Int {
        var resultIndex = NSNotFound
        for (index, value) in self.values.enumerate() {
            if (valueToFind >= value) {
                resultIndex = index
            } else {
                break
            }
        }
        return resultIndex;
    }
    
    func findNext (valueToFind : UInt64) -> Int {
        var resultIndex = NSNotFound
        for (index, value) in self.values.enumerate().reverse() {
            if (valueToFind >= value) {
                resultIndex = index
            } else {
                break
            }
        }
        return resultIndex;
    }
    
}