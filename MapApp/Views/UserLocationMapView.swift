//
//  UserLocationMapView.swift
//  MapApp
//
//  Created by masato on 17/8/2021.
//

import SwiftUI
import MapKit

struct UserLocationMapView: View {
//    @Binding var userData: UserLocational
    @Binding var longitude: Double?
    @Binding var latitudeDetail: Double?

    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.75773, longitude: -73.985708),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))


    var pointsOfInterest = [
        AnnotatedItem(name: "Times Square", coordinate: .init(latitude: 40.75773, longitude: -73.985708)),
        AnnotatedItem(name: "Flatiron Building", coordinate: .init(latitude: 40.741112, longitude: -73.989723)),
        AnnotatedItem(name: "Empire State Building", coordinate: .init(latitude: 40.748817, longitude: -73.985428))
    ]



    var body: some View {

        Map(coordinateRegion: $region, annotationItems: pointsOfInterest) { item in
            MapMarker(coordinate: item.coordinate, tint: .red)
        }
        .edgesIgnoringSafeArea(.all)

    }
}

