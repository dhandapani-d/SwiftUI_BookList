//
//  MyBooksView.swift
//  iRead
//
//  Created by Dhandapani Devarajan on 15/07/19.
//  Copyright © 2019 imaginea. All rights reserved.
//

import SwiftUI

struct MyBooksView : View {
    
    @EnvironmentObject var books: BooksManager
    @State var showAddBookModal:Bool = false
    
    var body: some View {
        NavigationView {
            List(books.books) { book in
                NavigationLink(destination: BookDetailView(book: book)) {
                    BookRow(book: book)
                }
            }
            .navigationBarTitle(Text("My Books"), displayMode: .large)
                .navigationBarItems(trailing:
                    Button(action: {
                        self.showAddBookModal.toggle()
                    }, label: {
                        Image(systemName:"plus.circle.fill").resizable().frame(width:30,height:30).foregroundColor(Color.red)
                    })
            ).presentation(showAddBookModal ? Modal(AddBookView(isPresented: $showAddBookModal).environmentObject(books),
                                                    onDismiss: {
                                                        self.showAddBookModal = false
            }):nil)
        }
    }
}


struct BookRow : View {
    @ObjectBinding var book: Book
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            BookCoverImageView(book: book, imageModel: ImageModel(path: book.images?.first))
                .frame(width: 60, height: 100)
                .padding(2)
                .border(Color.gray)
            VStack(alignment: .leading, spacing: 4) {
                
                Text(book.title)
                    .font(.headline)
                HStack(){
                    
                    if book.isFavorite{
                        Image(systemName:"heart.circle.fill").resizable().frame(width:30,height:30).foregroundColor(Color.red)
                    }
                    if book.isRead != .unread{
                        Image(systemName: (book.isRead == .read) ? "bookmark.fill" : "clock" ).resizable().frame(width:25,height:25).foregroundColor(Color.red)
                    }
                    
                }
                
                Text(book.bookDescription)
                    .font(.body)
                    .lineLimit(3)
                
            }
        }
    }
}

#if DEBUG
struct MyBooksView_Previews : PreviewProvider {
    static var books = BooksManager()
    static var previews: some View {
        MyBooksView().environmentObject(books)
    }
}
#endif
