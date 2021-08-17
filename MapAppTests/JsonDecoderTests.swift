//
//  JsonDecoderTests.swift
//  MapAppTests
//
//  Created by masato on 17/8/2021.
//

import XCTest
@testable import MapApp

class JsonDecoderTests: XCTestCase {

    func testExample() {

        XCTAssertEqual(userLocations[0].email, "camacho.wagner@undefined.com")

        XCTAssertEqual(userLocations[0].location.longitude, nil)


        
    }
}
