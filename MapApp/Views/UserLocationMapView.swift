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
            Map(
                coordinateRegion: $region,
                annotationItems: pointsOfInterest,
                annotationContent: { (annotation) in
                MapAnnotation(coordinate: annotation.coordinate) {
                    VStack {
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
                    .background(Color.white)
                    .foregroundColor(Color.black)
                    .cornerRadius(5.0)
                    .border(LinearGradient(gradient: Gradient(colors: [.green, .blue]),
                                           startPoint: .topLeading,
                                           endPoint: .bottomTrailing),
                            width: 2)
                    

            }
            .edgesIgnoringSafeArea(.all)
        }



    }
}

