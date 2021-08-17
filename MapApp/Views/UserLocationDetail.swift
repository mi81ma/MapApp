//
//  UserLocationDetail.swift
//  MapApp
//
//  Created by masato on 17/8/2021.
//

import SwiftUI
import MapKit

struct UserLocationDetail: View {
    @Binding var userData: UserLocation
    @State var image: UIImage?

    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 22.3193039, longitude: 114.0),
        span: MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0))

    @State var pointsOfInterest = [
        AnnotatedItem(name: "Times Square", coordinate: .init(latitude: 22.3193039, longitude: 114.0)),
    ]
    @State var isLocation = false

    var body: some View {
        VStack {
            UserLocationMapView(region: $region, isLocation: $isLocation, pointsOfInterest: $pointsOfInterest)
            HStack {

                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .cornerRadius(75)
                        .overlay(
                            RoundedRectangle(cornerRadius: 75).stroke(Color.black, lineWidth: 1)
                        )
                }
                VStack{
                    HStack{
                        Text(userData.name.first)
                        Text(userData.name.last)
                        Spacer()
                    }
                    HStack{
                        Text(userData.email)
                        Spacer()

                    }

                }
                Spacer()
            }
            .padding()
            .border(LinearGradient(gradient: Gradient(colors: [.green, .blue]),
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing),
                    width: 2)
        }
        .padding(0.2)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            if userData.id != "NoData" {
                let url = userData.picture
                downloadImageAsync(url: URL(string: url)!) { image in
                    self.image = image
                }

                if userData.location.latitude == nil || userData.location.longitude == nil {
                    self.isLocation = false
                    self.region = MKCoordinateRegion(
                        center: CLLocationCoordinate2D(latitude: 22.3193039, longitude: 114.0),
                        span: MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0))

                } else {
                    self.isLocation = true
                    self.region = MKCoordinateRegion(
                        center: CLLocationCoordinate2D(latitude: userData.location.latitude!, longitude:    userData.location.longitude!),
                        span: MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0))

                    self.pointsOfInterest = [
                        AnnotatedItem(name: userData.name.first + userData.name.last, coordinate: .init(latitude:   userData.location.latitude!, longitude: userData.location.longitude!)),
                    ]
                }
            }
        }
    }
}


