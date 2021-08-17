//
//  UserLocationDetail.swift
//  MapApp
//
//  Created by masato on 17/8/2021.
//

import SwiftUI

struct UserLocationDetail: View {
    @Binding var userData: UserLocation
    @State var image: UIImage?

    var body: some View {
        VStack {
            UserLocationMapView(longitude: $userData.location.longitude, latitudeDetail: $userData.location.latitude)
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
            let url = userData.picture
            downloadImageAsync(url: URL(string: url)!) { image in
                self.image = image
            }
        }
    }
}


