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
    @Binding var region: MKCoordinateRegion
    @Binding var isLocation: Bool
    @Binding var pointsOfInterest: [AnnotatedItem]


    var body: some View {
        if isLocation == true {
//            Map(coordinateRegion: $region, annotationItems: pointsOfInterest) { item in
//                MapMarker(coordinate: item.coordinate, tint: .red)
//            }
//            .edgesIgnoringSafeArea(.all)

            Map(
                coordinateRegion: $region,
                annotationItems: pointsOfInterest,
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
        } else {

            ZStack{
                Map(coordinateRegion: $region)
                Text("No Location Data")
                    .font(.title)
                    .padding(10.0)
                    .background(Color.orange)
                    .foregroundColor(Color.white)
                    .cornerRadius(18.0)
                    

            }
            .edgesIgnoringSafeArea(.all)
        }



    }
}

