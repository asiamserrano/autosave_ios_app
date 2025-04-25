//
//  GameBuilder.swift
//  autosave_ios
//
//  Created by Asia Michelle Serrano on 4/8/25.
//

/*
 
 Used for observing a game object
 Needed for abstraction from game object
 
 */


import Foundation
import SwiftUI
import PhotosUI

public class GameBuilder: ObservableObject {
    
    @Published public var title: String
    @Published public var release: Date
    @Published public var boxart: Data?
    
    @Published public var editMode: EditMode
    @Published public var photosPickerItem: PhotosPickerItem? = nil
    @Published public var imagePicker: ImagePickerEnum = .picker
        
    public private(set) var original: GameSnapshot
    
    private var invalid: Set<GameSnapshot>
        
    public let status: GameStatusEnum
    
    public init(_ status: GameStatusEnum) {
        let comparator: GameSnapshot = .defaultValue(status)
        self.title = .defaultValue
        self.release = .defaultValue
        self.boxart = nil
        self.status = status
        self.original = comparator
        self.invalid = .init(comparator)
        self.editMode = .active
    }
    
    public init(_ model: GameModel) {
        let comparator: GameSnapshot = model.snapshot
        self.original = comparator
        self.title = comparator.title
        self.release = comparator.release
        self.boxart = comparator.boxart
        self.status = comparator.status
        self.original = comparator
        self.invalid = .init(comparator)
        self.editMode = .inactive
    }
    
}

extension GameBuilder {
    
    public var snapshot: GameSnapshot {
        .builder(self)
    }
    
    public func save() -> Void {
        let comparator: GameSnapshot = self.snapshot
        self.original = comparator
        self.invalid = .init(comparator)
//        self.new = false
    }
    
    public func fail() -> Void {
        self.invalid.insert(self.snapshot)
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
        self.invalid.contains(self.snapshot) || self.snapshot.title_canon.isEmpty
    }
    
    public var isNew: Bool {
        self.original == .defaultValue(self.status)
    }
    
    public var uuid: UUID {
        self.original.uuid
    }
    
}

public enum ImagePickerEnum: Enumerable {
    case picker, paste
}
