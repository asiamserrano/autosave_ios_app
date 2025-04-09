//
//  ModelContext.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/4/25.
//

import Foundation
import SwiftData

extension ModelContext {
    
    public func add(_ game: GameModel) -> Void {
        self.insert(game)
        self.store()
    }
    
    public func remove(_ game: GameModel) -> Void {
        self.delete(game)
        self.store()
    }
    
    public func add(_ item: Item) -> Void {
        self.insert(item)
        self.store()
    }
    
    public func remove(_ item: Item) -> Void {
        self.delete(item)
        self.store()
    }
    
    public func store() {
        do {
            try self.save()
        } catch let error {
            fatalError("error saving in model context: \(error.localizedDescription)")
        }
    }
    
    func save(_ builder: GameBuilder) -> (String, Bool) {
        let new: GameModel? = self.fetch(builder.comparator).first
        if let old: GameModel = builder.model {
            if let game: GameModel = new, old.uuid != game.uuid {
                return ("failed: game already exists", false)
            } else {
                let game: GameModel = builder.save()
                self.store()
                return ("success: game has been edited", true)
            }
        } else {
            if let game: GameModel = new {
                return ("failed: game already exists", false)
            } else {
                let game: GameModel = builder.save()
                self.add(game)
                return ("success: game has been created", true)
            }
        }
    }
        
    func fetch(_ comparator: GameComparator) -> [GameModel] {
        do {
            let games: [GameModel] = try self.fetch(.getByCompositeKey(comparator))
            return .init(games)
        } catch {
            print("error: \(error)")
            return .init()
        }
    }
    
}
