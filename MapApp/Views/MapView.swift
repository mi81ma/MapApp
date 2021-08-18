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

    @State var pin:Bool = false


    var body: some View {

        ZStack {
        Map(
            coordinateRegion: $region,
            annotationItems: network.pointsOfInterest,
            annotationContent: { (annotation) in
                MapAnnotation(coordinate: annotation.coordinate) {
                    VStack {
                        if annotation.selected {
                        Text(annotation.name)
                            .font(.callout)
                            .background(Color.white)
                            .foregroundColor(Color.black)
                            .padding(2.0)
                            .border(LinearGradient(gradient: Gradient(colors: [.green, .blue]),
                                                   startPoint: .topLeading,
                                                   endPoint: .bottomTrailing),
                                    width: 1)
                            .cornerRadius(2.0)
                        }

                        Image(systemName: "mappin")
                            .foregroundColor( .red)
                            .onTapGesture {
                                if let idx = network.pointsOfInterest.firstIndex(where: { $0.id == annotation.id }) {
                                    network.pointsOfInterest[idx].selected.toggle()
                                }
                            }
                    }
                }
            })
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                network.getAllUserLocations()
            }

            if network.userLocations[0].id == "NoData" {
                Text("No Location Data")
                    .font(.title)
                    .padding(10.0)
                    .background(Color.white)
                    .foregroundColor(Color.black)
                    .cornerRadius(5.0)
                    .border(LinearGradient(gradient: Gradient(colors: [.green, .blue]),
                                           startPoint: .topLeading,
                                           endPoint: .bottomTrailing),
                            width: 2)
            }
        }
        

        

    }
}

