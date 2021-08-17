//
//  ContentView.swift
//  MapApp
//
//  Created by masato on 17/8/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("List View")
                    }
                }.tag(1)
            MapView()
                .tabItem {
                    VStack {
                        Image(systemName: "map")
                        Text("Map View")
                    }
                }.tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
