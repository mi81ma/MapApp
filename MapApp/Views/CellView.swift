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

                Text(userLocation.name.first)
                Text(userLocation.name.last)

                Spacer()
            }
            .padding()
            .border(LinearGradient(gradient: Gradient(colors: [.green, .blue]),
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing),
                    width: 3)

        }
        .padding()
        .onAppear {
            let url = userLocation.picture
            downloadImageAsync(url: URL(string: url)!) { image in
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
