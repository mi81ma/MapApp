//
//  AnnotatedItem.swift
//  MapApp
//
//  Created by masato on 17/8/2021.
//

import Foundation
import MapKit


struct AnnotatedItem: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
    var selected: Bool = false
}
