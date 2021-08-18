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
    @Binding var isShowName: Bool


    var body: some View {
        if isLocation == true {
            Map(
                coordinateRegion: $region,
                annotationItems: pointsOfInterest,
                annotationContent: { (annotation) in
                MapAnnotation(coordinate: annotation.coordinate) {
                    VStack {
                        if isShowName {
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
                                isShowName.toggle()
                            }
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

