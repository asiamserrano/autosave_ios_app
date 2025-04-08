//
//  GameComparator.swift
//  autosave_ios
//
//  Created by Asia Michelle Serrano on 4/8/25.
//

import Foundation

public struct GameComparator {
    public let title: String
    public let release: Date
    public let status: Bool
    public let boxart: Data?
    
    fileprivate init(title: String, release: Date, status: Bool, boxart: Data?) {
        self.title = title
        self.release = release
        self.status = status
        self.boxart = boxart
    }
    
    public class Builder {
        fileprivate var title: String
        fileprivate var release: Date
        fileprivate var status: Bool
        fileprivate var boxart: Data?
        
        public init() {
            self.title = .empty
            self.release = .today
            self.status = true
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
        
        public func build() -> GameComparator {
            .init(title: self.title, release: self.release, status: self.status, boxart: self.boxart)
        }
        
    }
    
}

extension GameComparator: Hashable {
    
    public var title_canon: String {
        title.canonicalize()
    }
    
    public var title_trim: String {
        title.trim()
    }
    
    public var release_date: String {
        release.dashless
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
