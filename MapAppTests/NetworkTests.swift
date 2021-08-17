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

    func test_FetchJson() throws {
        network.getUsers()
        let jsonData = network.$userLocations

        print(jsonData)
        

    }
  


    override func tearDown() {
        network = nil
        super.tearDown()
    }
}
