//
//  AddBookView.swift
//  iRead
//
//  Created by Dhandapani Devarajan on 16/07/19.
//  Copyright © 2019 imaginea. All rights reserved.
//

import SwiftUI
import Combine

struct AddBookView : View {
    @State var title:String = ""
    @State var description: String = "Lorem"
    @EnvironmentObject var books: BooksManager
    @Binding var isPresented:Bool
    func addBook() {
        let newBook = Book(id: 1767, title: self.title, description: self.description)
        self.books.books.append(newBook)
        //        self.isPresented?.value = false
    }
    
    func resetStateValue(){
        title = ""
        description = "Lorem"
    }
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Title")
                    TextField("Book Title", text:$title).font(.body)
                }
                Section{
                    Text("Description")
                    TextArea(text: $description).frame(width:UIScreen.main.bounds.width, height: 100).font(.body)
                }
                Section {
                    HStack(){
                        Spacer()
                        Button("Add Book", action: {
                            let newBook = Book(id: Int.random(in: 210..<999), title: self.title, description: self.description)
                            self.books.books.append(newBook)
                            self.isPresented = false
                            self.resetStateValue()
                        })
                        Spacer()
                    }
                }
                Section {
                    HStack(){
                        Spacer()
                        Button("Cancel", action: {
                            self.isPresented = false
                        }).foregroundColor(Color.red)
                        Spacer()
                    }
                }
                
            }.navigationBarTitle(Text("Add Book").font(.title))
            
        }
    }
    
}

#if DEBUG
struct AddBookView_Previews : PreviewProvider {
    @State static var present = true
    static var previews: some View {
        return AddBookView(isPresented: $present)
    }
}
#endif
