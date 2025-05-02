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
    public let display: Display
    
    // TODO: fix this
    public init(_ builder: PropertyBuilder) {
        self.uuid = .init()
        self.type = builder.propertyEnum
        self.display = builder.display
    }
    
    public init(_ model: PropertyModel) {
        self.uuid = model.uuid
        self.type = .init(model.type_id)
        self.display = .init(model)
    }

    public var type_id: String {
        self.type.id
    }
    
    public var value_canon: String {
        self.display.id
    }
    
    public var value_trim: String {
        self.display.display
    }
    
}

extension PropertySnapshot: Hashable {
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.type)
        hasher.combine(self.display)
    }
    
}
