//
//  MyBooksView.swift
//  iRead
//
//  Created by Dhandapani Devarajan on 15/07/19.
//  Copyright © 2019 imaginea. All rights reserved.
//

import SwiftUI

struct MyBooksView : View {
    var books:[Book] = []
    
    var body: some View {
        NavigationView {
            List(books) { book in
                NavigationLink(destination: BookDetailView(book: book)) {
                    BookRow(book: book)
                }
            }
            .navigationBarTitle(Text("My Books"), displayMode: .large)
        }
    }
}


struct BookRow : View {
    @State var book: Book
    var body: some View {
        HStack {
            BookCoverImageView(book: book, imageModel: ImageModel(path: book.images?.first))
                .frame(width: 60, height: 100)
                .padding(2)
                .border(Color.gray)
            VStack(alignment: .leading, spacing: 4) {
                Text(book.title)
                    .font(.headline)
                Text(book.bookDescription)
                    .font(.body)
                    .lineLimit(3)
                Text(book.isFavorite ? "Yes" : "No")
                Toggle(isOn: $book.isFavorite){
                    Text("Is Favorite Book?")
                }
            }
        }
    }
}

#if DEBUG
struct MyBooksView_Previews : PreviewProvider {
    static var previews: some View {
        MyBooksView(books: booksData!)
    }
}
#endif
