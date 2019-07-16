//
//  BookDetailView.swift
//  iRead
//
//  Created by Dhandapani Devarajan on 15/07/19.
//  Copyright © 2019 imaginea. All rights reserved.
//

import SwiftUI

struct BookDetailView : View {
    @State var book: Book
    @State var isFavorite:Bool = false
    @State var isOwned:Bool = false {
        didSet{
            toggleChanged()
        }
    }
    
    func toggleChanged(){
        print("toggle changed")
    }
    var body: some View {
        Form {
            Text(book.title).font(.title).lineLimit(nil).padding(4)
            BookCoverImageView(book: book, imageModel: ImageModel(path: book.images?.first))
                .frame(width:UIScreen.main.bounds.width, height: 200.0).aspectRatio(contentMode: .fill)
            Text(book.bookDescription).font(.body).lineLimit(nil).padding(4)
            Section{
                Toggle(isOn: $book.isFavorite){
                    Text("Is Favorite Book?") }
            }
            
            if book.isFavorite {
            Section{
                Toggle(isOn: $isOwned){
                    Text("Do you own this book?") }
            }
            }
        }.navigationBarTitle(Text(book.title), displayMode: .inline)    }
}

#if DEBUG
//struct BookDetailView_Previews : PreviewProvider {
//    static var previews: some View {
//        BookDetailView(book: booksData![0])
//    }
//}
#endif
