//
//  GameComparator.swift
//  autosave_ios
//
//  Created by Asia Michelle Serrano on 4/8/25.
//

import Foundation

public struct GameSnapshot {
    
    public static func defaultValue(_ status: GameStatusEnum) -> Self {
        let uuid: UUID = .init()
        let bool: Bool = status.bool
        let builder: Builder = .init(uuid, bool)
        return builder.build()
    }
    
    public static func random(_ status: GameStatusEnum) -> GameSnapshot {
        .init(uuid: UUID(), title: .random, release: .random, status: status.bool, boxart: nil)
    }
    
    public let uuid: UUID
    public let title: String
    public let release: Date
    public let status: GameStatusEnum
    public let boxart: Data?
    
    fileprivate init(uuid: UUID, title: String, release: Date, status: Bool, boxart: Data?) {
        self.uuid = uuid
        self.title = title
        self.release = release
        self.status = .init(status)
        self.boxart = boxart
    }
    
    public init(_ status: GameStatusEnum) {
        self.uuid = .init()
        self.title = .defaultValue
        self.release = .today
        self.status = status
        self.boxart = nil
    }
    
    public class Builder {
        fileprivate var uuid: UUID
        fileprivate var title: String
        fileprivate var release: Date
        fileprivate var status: Bool
        fileprivate var boxart: Data?
        
        public init(_ uuid: UUID, _ status: Bool) {
            self.uuid = uuid
            self.title = .defaultValue
            self.release = .today
            self.status = status
            self.boxart = nil
        }
        
        public func setTitle(_ title: String) -> Self {
            self.title = title
            return self
        }
        
        public func setRelease(_ release: Date) -> Self {
            self.release = release
            return self
        }
        
        public func setRelease(_ release: String) -> Self {
            self.release = .init(release)
            return self
        }
        
        public func setStatus(_ status: Bool) -> Self {
            self.status = status
            return self
        }
        
        public func setBoxart(_ boxart: Data?) -> Self {
            self.boxart = boxart
            return self
        }
        
        public func build() -> GameSnapshot {
            .init(uuid: self.uuid, title: self.title, release: self.release, status: self.status, boxart: self.boxart)
        }
        
    }
    
}



extension GameSnapshot: Hashable {
    
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
