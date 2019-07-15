//
//  Author.swift
//  iRead
//
//  Created by Dhandapani Devarajan on 11/07/19.
//  Copyright © 2019 imaginea. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Author
struct Author: Codable {
    let id: Int
    let name: String
}

#if DEBUG

let authors = getAuthors();

struct Authors: Codable {
    let authors: [Author]
}

func getAuthors() -> [Author]? {
    guard let asset = NSDataAsset(name: "Authors") else {
        fatalError("Missing data asset: Authors")
    }
    do {
        let decoder = JSONDecoder()
        let authors = try decoder.decode(Authors.self, from: asset.data)
        return authors.authors
    } catch _ {
        return nil
    }
}

#endif
