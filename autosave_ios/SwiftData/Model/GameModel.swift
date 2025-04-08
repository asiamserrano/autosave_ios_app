//
//  Game.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/4/25.
//

import Foundation
import SwiftData

@Model
public class GameModel {
    
    public private(set) var uuid: UUID
    public private(set) var added: Date
    
    public private(set) var title_canon: String
    public private(set) var title_trim: String
    public private(set) var release_date: String
    public private(set) var status_bool: Bool
    public private(set) var boxart_data: Data?
    
    public init(_ status: Bool) {
        let today: Date = .today
        self.uuid = .init()
        self.added = today
        self.title_canon = .empty
        self.title_trim = .empty
        self.release_date = today.dashless
        self.status_bool = status
        self.boxart_data = nil
    }
    
    public init(_ title: String, _ status: Bool) {
        let today: Date = .today
        self.uuid = .init()
        self.added = today
        self.title_canon = title.canonicalize()
        self.title_trim = title.trim()
        self.release_date = today.dashless
        self.status_bool = status
        self.boxart_data = nil
    }
    
}

extension GameModel {
    
    
    
    public func save(_ builder_comparator: GameComparator) -> GameModel {
        self.title_canon = builder_comparator.title_canon
        self.title_trim = builder_comparator.title_trim
        self.release_date = builder_comparator.release_date
        self.status_bool = builder_comparator.status
        self.boxart_data = builder_comparator.boxart
        return self
    }
    
    public var comparator: GameComparator {
        GameComparator.Builder()
            .setTitle(self.title_trim)
            .setRelease(self.release_date)
            .setStatus(self.status_bool)
            .setBoxart(self.boxart_data)
            .build()
    }
    
}
