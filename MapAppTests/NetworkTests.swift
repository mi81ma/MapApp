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


    func test_FetchJson() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            // After 2 seconds, the fetched json data is compared with preset json data
            let testJsonData = self.network.userLocations
            XCTAssertEqual(testJsonData, userLocations)
        }
    }


    func test_getAllUserLocations() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.network.getAllUserLocations()
            let testCase = self.network.pointsOfInterest[0]

            let expected = AnnotatedItem(name: "Camacho Wagner", coordinate: .init(latitude: 22.3417661, longitude: 114.0))
            XCTAssertEqual(testCase.name, expected.name)
        }
    }


    override func tearDown() {
        network = nil
        super.tearDown()
    }
}
