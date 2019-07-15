//
//  ImageService.swift
//  iRead
//
//  Created by Dhandapani Devarajan on 15/07/19.
//  Copyright © 2019 imaginea. All rights reserved.
//

import UIKit



class ImageService {
    static let shared = ImageService()
    private static let queue = DispatchQueue(label: "Image queue",
                                             qos: DispatchQoS.userInitiated)
    
    enum ImageError: Error {
        case decodingError
    }
    
    // Cache
    var imageCache: [String: UIImage] = [:]
    
    func image(url: URL, completionHandler: @escaping (Result<UIImage, Error>) -> Void) {
        if let cachedImage = imageCache[url.absoluteString] {
            completionHandler(.success(cachedImage))
            return
        }
        print("fetching.." + url.absoluteString)
        ImageService.queue.async {
            do {
                let data = try Data(contentsOf: url)
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    if let image = image {
                        self.imageCache[url.absoluteString] = image
                        completionHandler(.success(image))
                    } else {
                        completionHandler(.failure(ImageError.decodingError))
                    }
                }
            } catch let error {
                DispatchQueue.main.async {
                    completionHandler(.failure(error))
                }
            }
        }
    }

    
    
}
