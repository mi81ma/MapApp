//
//  UserLocation.swift
//  MapApp
//
//  Created by masato on 17/8/2021.
//

import Foundation
import SwiftUI
import CoreLocation

struct UserLocation: Codable {
    let id: String
    let name: Name
    let email: String
    let picture: String
    let location: Location

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, email, picture, location
    }


    // MARK: - Location
    struct Location: Codable {
        let latitude, longitude: Double?
    }

    // MARK: - Name
    struct Name: Codable {
        let last, first: String
    }
}
