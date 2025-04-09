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
    
    public func save(_ model: GameModel) -> Void {
        self.model = model
    }
    
    private var model_comparator: GameComparator {
        self.model?.comparator ?? .Builder()
            .setStatus(self.status)
            .build()
    }
    
    public func reset() -> Void {
        self.title = model_comparator.title
        self.release = model_comparator.release
        self.boxart = model_comparator.boxart
    }
        
    public var isNew: Bool {
        self.model == nil
    }
    
    public var isDisabled: Bool {
        model_comparator == self.comparator || self.comparator.title_canon.isEmpty
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


