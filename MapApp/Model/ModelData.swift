//
//  ModelData.swift
//  MapApp
//
//  Created by masato on 17/8/2021.
//

import Foundation

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


//func jsonDecode(jsonData: String) -> [UserLocation]? {
//    let jsonData_str = jsonData.data(using: .utf8)!
//    let decoder = JSONDecoder()
//    let catInfo = try! decoder.decode([UserLocation].self, from: jsonData_str)
//    return catInfo
//}
