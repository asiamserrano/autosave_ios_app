//
//  TextFieldView.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/11/25.
//

import SwiftUI

struct TextFieldView: View {
    
    @Binding private var binding: String
    
    private let keyboard: UIKeyboardType
    private let prompt: String
    
    public init(_ binding: Binding<String>, _ prompt: String = .defaultValue, keyboard: UIKeyboardType = .alphabet) {
        self._binding = binding
        self.keyboard = keyboard
        self.prompt = prompt
    }
    
    public var body: some View {
        HStack(alignment: .center, spacing: 5) {
            
            TextField(String.defaultValue, text: $binding, prompt: Text(prompt), axis: .vertical)
                .keyboardType(keyboard)
                .disableAutocorrection(true)
                .multilineTextAlignment(.leading)
            
            if !self.binding.isEmpty {
                Button(action: {
                    self.binding = .init()
                }, label: {
                    IconView(.xmark_circle_fill)
                })
                .buttonStyle(.plain)
            }
            
        }
    }
    
}
