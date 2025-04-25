//
//  Game.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/4/25.
//


/*
 
 Model class for a game
 
 */


import Foundation
import SwiftData

@Model
public class GameModel {
    
    public static func snapshot(_ snapshot: GameSnapshot) -> GameModel {
        .init().update(snapshot)
    }
    
    public private(set) var uuid: UUID
    public private(set) var added: Date
    
    public private(set) var title_canon: String
    public private(set) var title_trim: String
    public private(set) var release_date: String
    public private(set) var status_bool: Bool
    public private(set) var boxart_data: Data?
    
    private init() {
        let today: Date = .defaultValue
        self.uuid = .init()
        self.added = today
        self.title_canon = .defaultValue
        self.title_trim = .defaultValue
        self.release_date = today.dashless
        self.status_bool = true
        self.boxart_data = nil
    }
    
    
//    public init(_ status: Bool) {
//        let today: Date = .defaultValue
//        self.uuid = .init()
//        self.added = today
//        self.title_canon = .defaultValue
//        self.title_trim = .defaultValue
//        self.release_date = today.dashless
//        self.status_bool = status
//        self.boxart_data = nil
//    }
//    
//    public init(_ title: String, _ status: GameStatusEnum) {
//        let today: Date = .defaultValue
//        self.uuid = .init()
//        self.added = today
//        self.title_canon = title.canonicalize()
//        self.title_trim = title.trim()
//        self.release_date = today.dashless
//        self.status_bool = status.bool
//        self.boxart_data = nil
//    }
    
//    public init(_ comparator: GameSnapshot) {
//        self.uuid = comparator.uuid
//        self.added = .defaultValue
//        self.title_canon = comparator.title_canon
//        self.title_trim = comparator.title_trim
//        self.release_date = comparator.release_date
//        self.status_bool = comparator.status_bool
//        self.boxart_data = comparator.boxart
//    }
    
}

extension GameModel {
    
    @discardableResult
    public func update(_ other: GameSnapshot) -> GameModel {
        self.title_canon = other.title_canon
        self.title_trim = other.title_trim
        self.release_date = other.release_date
        self.status_bool = other.status_bool
        self.boxart_data = other.boxart
        return self
    }
    
    @discardableResult
    public func update(_ status: GameStatusEnum) -> GameModel {
        self.status_bool = status.bool
        return self
    }
    
    public var snapshot: GameSnapshot {
        .model(self)
    }
    
//    public var snapshot: GameSnapshot {
//        GameSnapshot.Builder(self.uuid, self.status_bool)
//            .setTitle(self.title_trim)
//            .setRelease(self.release_date)
//            .setStatus(self.status_bool)
//            .setBoxart(self.boxart_data)
//            .build()
//    }
    
}
