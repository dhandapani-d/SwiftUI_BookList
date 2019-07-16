//
//  TextArea.swift
//  iRead
//
//  Created by Dhandapani Devarajan on 16/07/19.
//  Copyright © 2019 imaginea. All rights reserved.
//

import SwiftUI

struct TextArea : UIViewRepresentable {    
    @Binding var text: String
    
    var onEditingChanged: ((String) -> Void)?
    var onCommit: (() -> Void)?
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Self.Context) -> UITextView {
        let textView = UITextView()
        textView.delegate = context.coordinator
        textView.font = UIFont.systemFont(ofSize: 16)
        return textView
    }
    
    /// Updates the presented `UIView` (and coordinator) to the latest
    /// configuration.
    func updateUIView(_ uiView: UITextView, context: Self.Context) {
        uiView.text = self.text
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        var field: TextArea
        
        init(_ field: TextArea) {
            self.field = field
        }
        
        func textViewDidChange(_ textView: UITextView) {
            field.text = textView.text
        }
    }
}

#if DEBUG
struct TextArea_Previews : PreviewProvider {
    @State static var text: String = "Lorem";
    static var previews: some View {
        TextArea(text: $text)
    }
}
#endif
