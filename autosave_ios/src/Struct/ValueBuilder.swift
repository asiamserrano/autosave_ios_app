//
//  ValueBuilder.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/19/25.
//

import Foundation

public struct ValueBuilder: Identifiable {
    
    private let source: Displayable
    
    public init(_ src: Displayable) {
        self.source = src
    }
    
    public init(_ uuid: UUID) {
        self.init(uuid.uuidString)
    }
    
}

extension ValueBuilder: Displayable {
    
    public var id: String {
        self.source.id
    }
    
    public var display:  String {
        self.source.display
    }
    
}

extension ValueBuilder: Hashable {
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
        hasher.combine(self.display)
    }
    
}
