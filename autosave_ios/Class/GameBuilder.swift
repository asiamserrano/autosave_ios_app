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
    @Published public var editMode: EditMode
        
    public private(set) var original: GameComparator
    
    private var invalid: Set<GameComparator>
    
//    public private(set) var new: Bool
    
    public let status: GameStatusEnum
    
    public init(_ status: Bool) {
        let comparator: GameComparator = .init(status)
        self.title = .defaultValue
        self.release = .today
        self.boxart = nil
        self.status = comparator.status
        self.original = comparator
        self.invalid = .init(comparator)
        self.editMode = .active
//        self.new = true
    }
    
    public init(_ model: GameModel) {
        let comparator: GameComparator = model.comparator
        self.original = model.comparator
        self.title = comparator.title
        self.release = comparator.release
        self.boxart = comparator.boxart
        self.status = comparator.status
        self.original = comparator
        self.invalid = .init(comparator)
        self.editMode = .inactive
//        self.new = false
    }
    
}

extension GameBuilder {
    
    public func save() -> Void {
        let comparator: GameComparator = self.current
        self.original = comparator
        self.invalid = .init(comparator)
//        self.new = false
    }
    
    public func fail() -> Void {
        self.invalid.insert(current)
    }
    
    public func reset() -> Void {
        self.title = original.title
        self.release = original.release
        self.boxart = original.boxart
    }
    
    func cancel() -> Void {
        self.title = original.title
        self.release = original.release
        self.boxart = original.boxart
//        self.properties = previous.properties
//        self.systemBuilder = nil

        self.editMode = .inactive
//        self.propertyEnum = .defaultValue
//        self.systemEnum = nil
//        self.navigate = false
    }
        
    public var isDisabled: Bool {
        self.invalid.contains(self.current) || self.current.title_canon.isEmpty
    }
    
    public var current: GameComparator {
        let uuid: UUID = self.original.uuid
        let status: Bool = self.original.status_bool
        return GameComparator.Builder(uuid, status)
            .setTitle(self.title)
            .setRelease(self.release)
            .setStatus(status)
            .setBoxart(self.boxart)
            .build()
    }
    
}


