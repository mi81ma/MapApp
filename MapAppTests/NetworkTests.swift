//
//  NetworkTests.swift
//  MapAppTests
//
//  Created by masato on 17/8/2021.
//

import XCTest
@testable import MapApp

class NetworkTests: XCTestCase {
    var network: Network!

    override func setUp() {
        super.setUp()
        network = Network()
    }

    func delay(testCase: XCTestCase, seconds: Float) {
        let delay = testCase.expectation(description: "Wait fetch json data from network")
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(seconds)) {
            delay.fulfill()
        }
        testCase.waitForExpectations(timeout: TimeInterval(seconds + 1.0))
    }

    func test_FetchJson() throws {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            // After 2 seconds, the fetched json data is compared with preset json data
            let testJsonData = self.network.userLocations
            XCTAssertEqual(testJsonData, userLocations)

        }

        

    }
  


    override func tearDown() {
        network = nil
        super.tearDown()
    }
}
