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
    
    func addBook() {
    }
    
    var body: some View {
        VStack {
            Text("Add Book")
            Form {
                Section {
                    TextField("Book Title", text:$title)
                    TextArea(text: $description)
                }
                Section {
                    Button("Add Book", action: addBook)
                }
            }
        }
    }
}

#if DEBUG
struct AddBookView_Previews : PreviewProvider {
    static var previews: some View {
        return AddBookView()
    }
}
#endif
