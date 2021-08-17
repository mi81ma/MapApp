//
//  TabBview.swift
//  MapApp
//
//  Created by masato on 17/8/2021.
//

import SwiftUI
import MapKit

struct MapView: View {
    @EnvironmentObject var network: Network

    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 22.3193039, longitude: 114.0),
        span: MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0))


    var body: some View {

        Map(coordinateRegion: $region, annotationItems: network.pointsOfInterest) { item in
            MapMarker(coordinate: item.coordinate, tint: .red)
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            network.getAllUserLocations()
        }

    }
}

//struct TabBView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapView()
//    }
//}
