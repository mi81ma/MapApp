//
//  InfrastructureFunctions.swift
//  MapApp
//
//  Created by masato on 17/8/2021.
//

import Foundation
import UIKit

func downloadImageAsync(url: URL, completion: @escaping (UIImage?) -> Void) {
    let session = URLSession(configuration: .default)
    let task = session.dataTask(with: url) { (data, _, _) in
        var image: UIImage?
        if let imageData = data {
            image = UIImage(data: imageData)
        }
        DispatchQueue.main.async {
            completion(image)
        }
    }
    task.resume()
}
