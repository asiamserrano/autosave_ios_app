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
        let current: GameComparator = builder.current
        let new: GameModel? = self.fetch(.getByCompositeKey(current))
        if let old: GameModel = self.fetch(.getByUUID(builder.original)) {
            if let new: GameModel = new, old.uuid != new.uuid {
                return ("failed: game already exists", false)
            } else {
                old.update(current)
                self.store()
                return ("success: game has been edited", true)
            }
        } else {
            if new == nil {
                let game: GameModel = .init(current)
                self.add(game)
                return ("success: game has been created", true)
            } else {
                return ("failed: game already exists", false)
            }
        }
    }
    
    func fetch(_ desc: GameFetchDescriptor) -> GameModel? {
        do {
            let games: [GameModel] = try self.fetch(desc)
            return games.first
        } catch {
            print("error: \(error)")
            return nil
        }
    }
    
}
