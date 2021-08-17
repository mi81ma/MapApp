//
//  CellView.swift
//  MapApp
//
//  Created by masato on 17/8/2021.
//

import SwiftUI

struct CellView: View {
    @State var image: UIImage?

    var userLocation: UserLocation
    var body: some View {

        HStack {
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
                if userLocation.id == "NoData"{
                    Image(systemName: "wifi.exclamationmark")
                    Text("Internet connection is poor...")

                }else{
                    Text(userLocation.name.first)
                    Text(userLocation.name.last)
                }


                Spacer()
            }
            .padding()
            .border(LinearGradient(gradient: Gradient(colors: [.green, .blue]),
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing),
                    width: 1)

        }
        .padding(0.2)
        .onAppear {
            let url = userLocation.picture
            let _url = url == "" ? "https://commons.wikimedia.org/wiki/Main_Page#/media/File:1665_Girl_with_a_Pearl_Earring.jpg": url
            downloadImageAsync(url: URL(string: _url)!) { image in
                self.image = image
            }
        }

    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {

            CellView(userLocation: userLocations[3])


    }
}
