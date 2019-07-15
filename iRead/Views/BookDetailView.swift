//
//  BookDetailView.swift
//  iRead
//
//  Created by Dhandapani Devarajan on 15/07/19.
//  Copyright © 2019 imaginea. All rights reserved.
//

import SwiftUI

struct BookDetailView : View {
    var book: Book
    var body: some View {
        Text(book.title)
    }
}

#if DEBUG
struct BookDetailView_Previews : PreviewProvider {
    static var previews: some View {
        BookDetailView(book: booksData![0])
    }
}
#endif
