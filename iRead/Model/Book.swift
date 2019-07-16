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

enum ReadOptions:CaseIterable{
    case unread
    case read
    case inProgress
    
    func description() -> String{
        switch(self){
        case .unread: return "Unread"
        case .read: return "Read"
        case .inProgress: return "In Progress"
        }
    }
}


class Book: Codable, Identifiable, BindableObject  {
    let id: Int
    var title: String {
        didSet {
            DispatchQueue.main.async {
                self.didChange.send()
            }
        }
    }
    var bookDescription: String

    let images: [String]? = nil
    let authors: [Int]? = nil 
    var isFavorite : Bool = false {
        didSet{
            DispatchQueue.main.async {
                self.didChange.send()
            }
        }
    }
    
    init(id: Int, title: String, description: String) {
        self.id = id
        self.title = title
        self.bookDescription = description
    }
    
    
    var isRead: ReadOptions = .unread {
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
