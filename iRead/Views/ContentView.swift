//
//  ContentView.swift
//  iRead
//
//  Created by Dhandapani Devarajan on 11/07/19.
//  Copyright © 2019 imaginea. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @State private var selection = 0
 
    var body: some View {
        TabbedView(){
            MyBooksView(books: booksData!)
                .tabItem({
                    Image(systemName:"list.dash")
                    Text("My Books")
                }).tag(0)
            ProfileView()
                .tabItem({
                    Image(systemName: "person")
                    Text("Profile")
                })
                .tag(1)
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
