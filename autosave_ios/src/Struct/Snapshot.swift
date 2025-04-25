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

public struct Snapshot {
    
    public static func defaultValue(_ status: GameStatusEnum) -> Self {
        .init(.init(), .defaultValue, .defaultValue, status, nil)
    }
    
    public static func random(_ status: GameStatusEnum) -> Snapshot {
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
    
    public let game: GameSnapshot
    public let properties: Propety
    
    private init(_ game: GameSnapshot) {
        self.uuid = u
        self.title = t
        self.release = r
        self.status = s
        self.boxart = b
    }
    
    public var title_canon: String {
        title.canonicalize()
    }
    
    public var title_trim: String {
        title.trim()
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
    
//    public init(_ status: GameStatusEnum) {
//        self.uuid = .init()
//        self.
//    }
    
//    public let attributes: AttributesSnapshot
//    
//    fileprivate init(uuid: UUID, title: String, release: Date, status: Bool, boxart: Data?) {
//        self.uuid = uuid
//        self.title = title
//        self.release = release
//        self.status = .init(status)
//        self.boxart = boxart
//    }
//    
//    public init(_ status: GameStatusEnum) {
//        self.uuid = .init()
//        self.title = .defaultValue
//        self.release = .today
//        self.status = status
//        self.boxart = nil
//    }
//    
//    public class Builder {
//        fileprivate var uuid: UUID
//        fileprivate var title: String
//        fileprivate var release: Date
//        fileprivate var status: Bool
//        fileprivate var boxart: Data?
//        
//        public init(_ uuid: UUID, _ status: Bool) {
//            self.uuid = uuid
//            self.title = .defaultValue
//            self.release = .today
//            self.status = status
//            self.boxart = nil
//        }
//        
//        public func setTitle(_ title: String) -> Self {
//            self.title = title
//            return self
//        }
//        
//        public func setRelease(_ release: Date) -> Self {
//            self.release = release
//            return self
//        }
//        
//        public func setRelease(_ release: String) -> Self {
//            self.release = .init(release)
//            return self
//        }
//        
//        public func setStatus(_ status: Bool) -> Self {
//            self.status = status
//            return self
//        }
//        
//        public func setBoxart(_ boxart: Data?) -> Self {
//            self.boxart = boxart
//            return self
//        }
//        
//        public func build() -> GameSnapshot {
//            .init(uuid: self.uuid, title: self.title, release: self.release, status: self.status, boxart: self.boxart)
//        }
//        
//    }
    
}



extension Snapshot: Hashable {
    
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
