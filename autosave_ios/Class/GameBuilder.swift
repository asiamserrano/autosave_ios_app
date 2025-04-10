//
//  GameBuilder.swift
//  autosave_ios
//
//  Created by Asia Michelle Serrano on 4/8/25.
//

import Foundation
import SwiftUI

public class GameBuilder: ObservableObject {
    
    @Published public var title: String
    @Published public var release: Date
    @Published public var boxart: Data?
        
    public private(set) var original: GameComparator
    
    private var invalid: Set<GameComparator>
    
    public private(set) var new: Bool
    
    public init(_ status: Bool) {
        self.title = .empty
        self.release = .today
        self.boxart = nil
        self.original = .init(status)
        self.invalid = .init(.init(status))
        self.new = true
    }
    
    public init(_ model: GameModel) {
        let comparator: GameComparator = model.comparator
        self.original = model.comparator
        self.title = comparator.title
        self.release = comparator.release
        self.boxart = comparator.boxart
        self.original = comparator
        self.invalid = .init(comparator)
        self.new = false
    }
    
}

extension GameBuilder {
    
    public func save() -> Void {
        let comparator: GameComparator = self.current
        self.original = comparator
        self.invalid = .init(comparator)
        self.new = false
    }
    
    public func fail() -> Void {
        self.invalid.insert(current)
    }
    
    public func reset() -> Void {
        self.title = original.title
        self.release = original.release
        self.boxart = original.boxart
    }
        
    public var isDisabled: Bool {
        self.invalid.contains(self.current) || self.current.title_canon.isEmpty
    }
    
    public var current: GameComparator {
        let uuid: UUID = self.original.uuid
        let status: Bool = self.original.status
        return GameComparator.Builder(uuid, status)
            .setTitle(self.title)
            .setRelease(self.release)
            .setStatus(status)
            .setBoxart(self.boxart)
            .build()
    }
    
}


