//
//  ToggleButton.swift
//  iRead
//
//  Created by Murali Krishnan on 16/07/19.
//  Copyright © 2019 imaginea. All rights reserved.
//

import SwiftUI

struct ToggleButton : View {
    @Binding var isOn:Bool
    var body: some View {
        Button(
        action: { self.isOn.toggle() }){
            HStack(){
                Spacer()
                Image(systemName: self.isOn ? "heart" : "heart.fill")
                Text(self.isOn ? "Remove from favorites" : "Add to favorites")
                Spacer()
            }.padding(4)
        }
    }
}

#if DEBUG
struct ToggleButton_Previews : PreviewProvider {
    @State static var toggleState = true
    static var previews: some View {
        ToggleButton(isOn: $toggleState)
    }
}
#endif
