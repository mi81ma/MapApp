//
//  TabAview.swift
//  MapApp
//
//  Created by masato on 17/8/2021.
//

import SwiftUI

struct ListView: View {
    

    var body: some View {
        NavigationView {
            List (userLocations, id: \.id){ userLocation in
                NavigationLink(
                    destination: UserLocationDetail(),
                    label: {
                        CellView(userLocation: userLocation)

                    })

            }
            .navigationBarHidden(true)

        }

    }
}

struct TabAview_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
