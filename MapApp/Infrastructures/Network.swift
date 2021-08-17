//
//  Network.swift
//  MapApp
//
//  Created by masato on 17/8/2021.
//

import Foundation

class Network: ObservableObject {
    @Published var userLocations: [UserLocation] = [UserLocation(id: "", name: UserLocation.Name(last: "", first: ""), email: "", picture: "", location: UserLocation.Location())]

    init() {
        getUsers()
    }



    func getUsers() {
        guard let url = URL(string: "https://api.json-generator.com/templates/Xp8zvwDP14dJ/data?access_token=v3srs6i1veetv3b2dolta9shrmttl72vnfzm220z") else { fatalError("Missing URL") }

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
}


