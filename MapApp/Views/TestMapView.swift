//
//  TestMapView.swift
//  MapApp
//
//  Created by masato on 17/8/2021.
//

import SwiftUI

import SwiftUI
import MapKit

struct TestMapView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.33501993272811, longitude: -122.00912876460102),
                                                   latitudinalMeters: 30000, longitudinalMeters: 30000)
    @State private var annotations: [Annotation] = [
        Annotation(name: "Apple Park",
                   coordinate: CLLocationCoordinate2D(latitude: 37.33501993272811,
                                                      longitude: -122.00912876460102)),
        Annotation(name: "Googleplex",
                   coordinate: CLLocationCoordinate2D(latitude: 37.42231267779884,
                                                      longitude: -122.08400387147682)),
        Annotation(name: "Facebook HQ",
                   coordinate: CLLocationCoordinate2D(latitude:37.48493581456912,
                                                      longitude: -122.14960893718997)),
    ]

    var body: some View {
        Map(coordinateRegion: $region,
            annotationItems: annotations,
            annotationContent: { (annotation) in
                MapAnnotation(coordinate: annotation.coordinate) {
                    VStack {
                        Text(annotation.name)
                        Image(systemName: "mappin.circle.fill")
                            .foregroundColor( annotation.selected ? .red : .blue)
                            .onTapGesture {
                                if let idx = annotations.firstIndex(where: { $0.id == annotation.id }) {
                                    annotations[idx].selected.toggle()
                                }
                            }
                    }
                }
            })
            .edgesIgnoringSafeArea(.all)
    }
}

struct Annotation: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    var selected: Bool = false
}

struct TestMapView_Previews: PreviewProvider {
    static var previews: some View {
        TestMapView()
    }
}
