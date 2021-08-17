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
            Map(coordinateRegion: $region, annotationItems: pointsOfInterest) { item in
                MapMarker(coordinate: item.coordinate, tint: .red)
            }
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

