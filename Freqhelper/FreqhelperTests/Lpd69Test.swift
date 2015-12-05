//
//  Lpd69Test.swift
//  Freqhelper
//
//  Created by Andrey Agafonov on 04/11/15.
//  Copyright © 2015 anagaf. All rights reserved.
//

import XCTest
@testable import Freqhelper

class Lpd69Test: XCTestCase {

    func test() {
        let bundle = NSBundle(forClass: self.dynamicType)
        let path = bundle.pathForResource("lpd69", ofType: "txt")
        do {
            let content = try String(contentsOfFile: path!)
            let frequencies = content.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet())
            let range = Lpd69()
            XCTAssertEqual(range.values.count, frequencies.count)
            for i in 0..<range.values.count {
                XCTAssertEqual(range.values[i], self.parseFrequency(frequencies[i]))
            }
        } catch {
            XCTFail()
        }
    }
    
    func testPrevChannel() {
        let range = Lpd69()
        XCTAssertNil(range.findPrev(range.values[0]))
        XCTAssertEqual(0, range.findPrev(range.values[1]))
        XCTAssertEqual(2, range.findPrev(range.values[3]))
        
        XCTAssertEqual(range.values.count - 2, range.findPrev(range.values[range.values.count - 1]))
        XCTAssertEqual(range.values.count - 3, range.findPrev(range.values[range.values.count - 2]))
        
        XCTAssertEqual(1, range.findPrev(range.values[1] + 1))
        XCTAssertEqual(0, range.findPrev(range.values[1] - 1))
    }

    func testNextChannel() {
        let range = Lpd69()
        XCTAssertEqual(1, range.findNext(range.values[0]))
        XCTAssertEqual(2, range.findNext(range.values[1]))
        
        XCTAssertNil(range.findNext(range.values[range.values.count - 1]))
        XCTAssertEqual(range.values.count - 1, range.findNext(range.values[range.values.count - 2]))
        
        XCTAssertEqual(1, range.findNext(range.values[0] + 1))
        XCTAssertEqual(1, range.findNext(range.values[1] - 1))
    }
    
    func parseFrequency(str : String) -> UInt64? {
        let components = str.componentsSeparatedByString(".")
        let mhz = UInt64(components[0])
        let khz = UInt64(components[1])
        if (components.count == 2) {
            return FrequencyConverter.decihertzWithMegahertz(mhz!, kilohertz: khz!)
        } else if (components.count == 3) {
            let hz = UInt64(components[2])
            return FrequencyConverter.decihertzWithMegahertz(mhz!, kilohertz: khz!, hertz: hz!)
        }
        return nil
    }
}