//
//  ImageModel.swift
//  iRead
//
//  Created by Dhandapani Devarajan on 15/07/19.
//  Copyright © 2019 imaginea. All rights reserved.
//

import SwiftUI
import Combine
import UIKit


class ImageModel: BindableObject {
    // Publisher Object
    let didChange = PassthroughSubject<UIImage?, Never>()
    
    let imageURL: URL?
    
    var image: UIImage? = nil {
        didSet {
            DispatchQueue.main.async {
                self.didChange.send(self.image)
            }
        }
    }
    
    var missing: Bool = false {
        didSet {
            DispatchQueue.main.async {
                self.didChange.send(nil)
            }
        }
    }
    
    init(path: String?) {
        guard let path = path else {
            imageURL = nil;
            return
        }
        if let url = URL(string: path) {
            imageURL = url
        } else {
            imageURL = nil
        }
    }
    
    func loadImage() {
        guard let url = self.imageURL else {
            missing = true
            return
        }
        ImageService.shared.image(url: url) {[weak self] result in
            do {
                self?.image = try result.get()
            } catch {
                
            }
        }
    }

}
