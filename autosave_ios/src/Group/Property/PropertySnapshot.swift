//
//  PropertySnapshot.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/19/25.
//

import Foundation

public struct PropertySnapshot {
    
    public let uuid: UUID
    public let type: PropertyEnum
    public let value: ValueBuilder
    
//    public init(_ model: PropertyModel) {
//        self.uuid = model.uuid
//        self.type = .init(model.type_id)
//        self.value = .ini
//    }
    
    private init(_ type: PropertyEnum, _ value: ValueBuilder) {
        self.uuid = .init()
        self.type = type
        self.value = value
    }
    
}

extension PropertySnapshot: Hashable {
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.type)
        hasher.combine(self.value)
    }
    
}
