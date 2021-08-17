//
//  TabAview.swift
//  MapApp
//
//  Created by masato on 17/8/2021.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var network: Network
    @State var observedUserlocationDetails = userLocations

    var body: some View {

        List (Array(network.userLocations.enumerated()), id: \.element){ index, userLocation in
            NavigationLink(
                destination: UserLocationDetail(userData: self.$network.userLocations[index]),
                label: {
                    CellView(userLocation: userLocation)
                })
        }
        .navigationBarHidden(true)
        .onAppear {
            network.getUsers()

        }
    }
}

