//
//  Book.swift
//  iRead
//
//  Created by Dhandapani Devarajan on 11/07/19.
//  Copyright © 2019 imaginea. All rights reserved.
//

import UIKit
import SwiftUI
import Combine



// MARK: - Book
class Book: Codable, Identifiable, BindableObject  {
    let id: Int
    let title, bookDescription: String
    let images: [String]?
    let authors: [Int]
    var isFavorite : Bool{
        didSet{
            DispatchQueue.main.async {
                self.didChange.send()
            }
        }
    }
    let didChange = PassthroughSubject<Void, Never>()
    
    
    enum CodingKeys: String, CodingKey {
        case id, title
        case bookDescription = "description"
        case images, authors
        case isFavorite
    }
}

#if DEBUG

let booksData = getData();

struct Books: Codable {
    let books: [Book]
}

func getData() -> [Book]? {
    guard let asset = NSDataAsset(name: "Books") else {
    fatalError("Missing data asset: Books")
    }
    do {
        let decoder = JSONDecoder()
        let books = try decoder.decode(Books.self, from: asset.data)
        print(books)
        return books.books
    } catch _ {
        return nil
    }
}

#endif
