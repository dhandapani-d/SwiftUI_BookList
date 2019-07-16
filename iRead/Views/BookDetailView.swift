//
//  BookDetailView.swift
//  iRead
//
//  Created by Dhandapani Devarajan on 15/07/19.
//  Copyright © 2019 imaginea. All rights reserved.
//

import SwiftUI

struct BookDetailView : View {
    @ObjectBinding var book: Book

    var body: some View {
        Form {
            Text(book.title).font(.title).lineLimit(nil).padding(4)
            BookCoverImageView(book: book, imageModel: ImageModel(path: book.images?.first))
                .frame(width:UIScreen.main.bounds.width, height: 200.0).aspectRatio(contentMode: .fill)
            Text(book.bookDescription).font(.body).lineLimit(nil).padding(4)
            Section{
                ToggleButton(isOn: $book.isFavorite)
            }
            
            if book.isFavorite {
                Section{
                    
                    Picker(
                        selection: $book.isRead,
                        label: Text("Reading Status")
                    ) {
                        ForEach(ReadOptions.allCases.identified(by: \.self)) {
                            Text($0.description()).tag($0)
                        }
                    }
                }
            }
        }.navigationBarTitle(Text(book.title), displayMode: .inline)    }
}

#if DEBUG
struct BookDetailView_Previews : PreviewProvider {
    static var previews: some View {
        BookDetailView(book: booksData![0])
    }
}
#endif
