//
//  GameComparator.swift
//  autosave_ios
//
//  Created by Asia Michelle Serrano on 4/8/25.
//

/*
 
 Used for simple transfer of game information
 Needed to refrain from creating/updating model objects uneccessarily
 
 */

import Foundation

public struct GameSnapshot {
    
    public static func defaultValue(_ status: GameStatusEnum) -> Self {
        .init(.init(), .defaultValue, .defaultValue, status, nil)
    }
    
    public static func random(_ status: GameStatusEnum) -> GameSnapshot {
        .init(.init(), .random, .random, status, nil)
    }
    
    public static func builder(_ builder: GameBuilder) -> Self {
        .init(builder.uuid, builder.title, builder.release, builder.status, builder.boxart)
    }
    
    public static func model(_ model: GameModel) -> Self {
        let release: Date = .init(model.release_date)
        let status: GameStatusEnum = .init(model.status_bool)
        return .init(model.uuid, model.title_trim, release, status, model.boxart_data)
    }
    
    public let uuid: UUID
    public let title: String
    public let release: Date
    public let status: GameStatusEnum
    public let boxart: Data?
    
    private init(_ u: UUID, _ t: String, _ r: Date, _ s: GameStatusEnum, _ b: Data?) {
        self.uuid = u
        self.title = t
        self.release = r
        self.status = s
        self.boxart = b
    }
    
    public var title_canon: String {
        title.id
    }
    
    public var title_trim: String {
        title.display
    }
    
    public var release_date: String {
        release.dashless
    }
    
    public var status_bool: Bool {
        self.status.bool
    }
    
    public var display: String {
        "\(self.title) (\(self.release.year))"
    }

}



extension GameSnapshot: Hashable {
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.title_trim)
        hasher.combine(self.release_date)
        hasher.combine(self.status)
        hasher.combine(self.boxart)
    }
    
}
