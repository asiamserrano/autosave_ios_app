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
    
    public let status: Bool
    private var model: GameModel?
    
    public init(_ status: Bool) {
        self.title = .empty
        self.release = .today
        self.boxart = nil
        self.status = status
        self.model = nil
    }
    
    public init(_ model: GameModel) {
        let comparator: GameComparator = model.comparator
        self.title = comparator.title
        self.release = comparator.release
        self.boxart = comparator.boxart
        self.status = comparator.status
        self.model = model
    }
    
}

extension GameBuilder {
    
    private var game_model: GameModel {
        if let model: GameModel = self.model {
            return model
        } else {
            return .init(self.status)
        }
    }
    
    public func save() -> GameModel {
        let new_model: GameModel = self.game_model.save(self.comparator)
        self.model = new_model
        return new_model
    }
    
    public func reset() -> Void {
        let other: GameComparator = game_model.comparator
        self.title = other.title
        self.release = other.release
        self.boxart = other.boxart
    }
        
    public var isNew: Bool {
        self.model == nil
    }
    
    public var isDisabled: Bool {
//        var other: GameComparator {
//            if let model: GameModel = self.model {
//                return model.comparator
//            } else {
//                let builder: GameBuilder = .init(self.status)
//                return builder.comparator
//            }
//        }
        let other: GameComparator = self.game_model.comparator
        return other == self.comparator || self.comparator.title_canon.isEmpty
    }
    
    public var comparator: GameComparator {
        GameComparator.Builder()
            .setTitle(self.title)
            .setRelease(self.release)
            .setStatus(self.status)
            .setBoxart(self.boxart)
            .build()
    }
    
}


