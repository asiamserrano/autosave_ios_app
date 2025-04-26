//
//  Displayable.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/25/25.
//

import Foundation

public protocol Displayable {
    var id: String { get }
    var display: String { get }
}

public extension Displayable {
    
    var builder: ValueBuilder {
        .init(self)
    }
    
}
