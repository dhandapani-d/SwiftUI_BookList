//
//  BookCoverImageView.swift
//  iRead
//
//  Created by Dhandapani Devarajan on 15/07/19.
//  Copyright © 2019 imaginea. All rights reserved.
//

import SwiftUI

struct BookCoverImageView : View {
    var book:Book
    @State var imageModel: ImageModel
    
    var body: some View {
        ZStack(alignment: .center) {
                if imageModel.image != nil {
                    Image(uiImage: imageModel.image!)
                        .resizable()
                        .aspectRatio(contentMode: ContentMode.fit)
                } else {
                    Text(book.title)
                        .font(.footnote)
                        .lineLimit(3)
                }
        }.onAppear {
            self.imageModel.loadImage()
        }
    }
}

#if DEBUG
struct BookCoverImageView_Previews : PreviewProvider {
    static var previews: some View {
        let book = booksData![0];
//        return BookCoverImageView(book: book)

        return BookCoverImageView(book: book, imageModel: ImageModel(path: book.images?.first))
    }
}
#endif
