//
//  ValueBuilder.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/19/25.
//

import Foundation

public struct ValueBuilder: Identifiable {
    
    public let id: String
    public let display: String
    
    public init(_ src: Displayable) {
        self.id = src.id
        self.display = src.display
    }
    
    public init(_ uuid: UUID) {
        self.init(uuid.uuidString)
    }
    
//    public init(_ id: String, _ display: String) {
//        self.id = id
//        self.display = display
//    }
    
    public init(_ model: PropertyModel) {
        self.id = model.value_canon
        self.display = model.value_trim
    }
    
}

//extension ValueBuilder: Displayable {
//    
//    public var id: String {
//        self.source.id
//    }
//    
//    public var display:  String {
//        self.source.display
//    }
//    
//}

extension ValueBuilder: Hashable {
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
        hasher.combine(self.display)
    }
    
}
