//
//  ModelData.swift
//  MapApp
//
//  Created by masato on 17/8/2021.
//

import Foundation

let endpointURL = "https://api.json-generator.com/templates/Xp8zvwDP14dJ/data?access_token=v3srs6i1veetv3b2dolta9shrmttl72vnfzm220z"

var userLocations: [UserLocation] = load("SampleData.json")


func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

