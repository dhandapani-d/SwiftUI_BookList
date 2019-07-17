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
    
    let didChange = PassthroughSubject<Void, Never>()

    let id: Int
    var title: String {
        didSet {
            DispatchQueue.main.async {
                self.didChange.send()
            }
        }
    }
    var bookDescription: String

    let images: [String]?
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
        self.images = nil
    }
    
    
    var isRead: ReadOptions = .unread {
        didSet{
            DispatchQueue.main.async {
                self.didChange.send()
            }
        }
    }
    
    
    
    enum CodingKeys: String, CodingKey {
        case id, title
        case bookDescription = "description"
        case images, authors
        case isFavorite
    }
}


let booksData = getData();

class BooksManager: Codable,BindableObject {
    
    var didChange = PassthroughSubject<Void, Never>()
    
    var books:[Book] = [Book]() {
        didSet{
            DispatchQueue.main.async {
                self.didChange.send()
            }
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case books
    }
    
    init() {
        books = booksData!;
    }
}

func getData() -> [Book]? {
    guard let asset = NSDataAsset(name: "Books") else {
    fatalError("Missing data asset: Books")
    }
    do {
        let decoder = JSONDecoder()
        let books = try decoder.decode(BooksManager.self, from: asset.data)
        print(books)
        return books.books
    } catch _ {
        return nil
    }
}

