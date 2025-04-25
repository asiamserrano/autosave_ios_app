//
//  PropertySnapshot.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/19/25.
//

import Foundation

public struct PropertySnapshot {
    
//    public static var defaultValue: Self {
//        .init(.defaultValue, .defaultValue)
//    }
//    
//    public static func random(_ status: GameStatusEnum) -> GameSnapshot {
//        .init(.init(), .random, .random, status, nil)
//    }
//    
//    public static func builder(_ builder: GameBuilder) -> Self {
//        .init(builder.uuid, builder.title, builder.release, builder.status, builder.boxart)
//    }
//    
//    public static func model(_ model: GameModel) -> Self {
//        let release: Date = .init(model.release_date)
//        let status: GameStatusEnum = .init(model.status_bool)
//        return .init(model.uuid, model.title_trim, release, status, model.boxart_data)
//    }
    
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
    
    public var type_id: String {
        self.type.id
    }
    
    public var value_canon: String {
        self.value.canon
    }
    
    public var value_trim: String {
        self.value.trim
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
