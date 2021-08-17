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


        Map(
            coordinateRegion: $region,
            annotationItems: network.pointsOfInterest,
            annotationContent: { (annotation) in
                MapAnnotation(coordinate: annotation.coordinate) {
                    VStack {
                        Text(annotation.name)
                            .font(.callout)
                            .background(Color.white)
                            .foregroundColor(Color.black)
                            .padding(1.0)
                            .border(Color.black, width: 1)
                            .cornerRadius(2.0)

                        Image(systemName: "mappin")
                            .foregroundColor( .red)
                    }
                }
            })
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                network.getAllUserLocations()
            }
        

        

    }
}

