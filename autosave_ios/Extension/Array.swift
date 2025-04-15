//
//  Array.swift
//  autosave_ios
//
//  Created by Asia Michelle Serrano on 4/10/25.
//

import Foundation

extension Array {
    
    public static var defaultValue: Self { .init() }
    
    public init(_ element: Element) {
        self.init()
        self.append(element)
    }
    
}
