//
//  Network.swift
//  MapApp
//
//  Created by masato on 17/8/2021.
//

import Foundation

class Network: ObservableObject {
    @Published var userLocations: [UserLocation] = [UserLocation(id: "NoData", name: UserLocation.Name(last: "", first: ""), email: "", picture: "", location: UserLocation.Location())]

    @Published var pointsOfInterest: [AnnotatedItem] = [AnnotatedItem(name: "NoData", coordinate: .init(latitude: 22.3193039, longitude: 114.0))]


    init() {
        getUsers()
    }



    func getUsers() {
        guard let url = URL(string: endpointURL) else { fatalError("Missing URL") }

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedUsers = try JSONDecoder().decode([UserLocation].self, from: data)
                        self.userLocations = decodedUsers
                        print("Network userlocations: ", self.userLocations)
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }

        dataTask.resume()
    }


    func getAllUserLocations() {
        var tempList:[AnnotatedItem] = []
        for oneUserData in self.userLocations {
            if oneUserData.location.latitude == nil || oneUserData.location.longitude == nil {
                continue
            }

            let oneAnnotatedItem = AnnotatedItem(name: oneUserData.name.first + " " + oneUserData.name.last, coordinate: .init(latitude: oneUserData.location.latitude!, longitude: oneUserData.location.longitude!))
            tempList.append(oneAnnotatedItem)
        }
        self.pointsOfInterest = tempList
    }
}


