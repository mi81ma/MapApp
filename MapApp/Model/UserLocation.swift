//
//  UserLocation.swift
//  MapApp
//
//  Created by masato on 17/8/2021.
//

import Foundation
import SwiftUI
import CoreLocation

struct UserLocation: Codable, Hashable {
    let id: String
    let name: Name
    let email: String
    let picture: String
    var location: Location

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, email, picture, location
    }


    // MARK: - Location
    struct Location: Codable, Hashable {
        var latitude, longitude: Double?
    }

    // MARK: - Name
    struct Name: Codable, Hashable {
        let last, first: String
    }
}
