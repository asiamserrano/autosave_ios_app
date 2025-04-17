//
//  ModelContext.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/4/25.
//

import Foundation
import SwiftData

extension ModelContext {
    
    public func fetchCount(_ status: GameStatusEnum) -> Int {
        let desc: GameFetchDescriptor = .getByStatus(status)
        do {
            return try self.fetchCount(desc)
        } catch {
            print("error: \(error)")
            return 0
        }
    }
    
    public func add(_ game: GameModel) -> Void {
        self.insert(game)
        self.store()
    }
    
    public func remove(_ game: GameModel) -> Void {
        self.delete(game)
        self.store()
    }
    
    func move(_ game: GameModel, _ next: GameStatusEnum) -> Void {
        game.update(next)
        self.store()
    }
    
    public func store() {
        do {
            try self.save()
        } catch let error {
            fatalError("error saving in model context: \(error.localizedDescription)")
        }
    }
    
    @discardableResult
    func save(_ builder: GameBuilder) -> GameResult {
        let current: GameSnapshot = builder.current
        let composite: GameFetchDescriptor = .getByCompositeKey(current)
        let new: GameModel? = self.fetchModel(composite)
        let uuid: GameFetchDescriptor = .getByUUID(builder.original)
        if let old: GameModel = self.fetchModel(uuid) {
            if let new: GameModel = new, old.uuid != new.uuid {
                return .init(new.snapshot, false, .edit)
            } else {
                old.update(current)
                self.store()
                return .init(current, true, .edit)
            }
        } else {
            if let new: GameModel = new {
                return .init(new.snapshot, false, .add)
            } else {
                let game: GameModel = .init(current)
                self.add(game)
                return .init(current, true, .add)
            }
        }
    }
    
    @discardableResult
    func save(_ current: GameSnapshot) -> GameResult {
        let composite: GameFetchDescriptor = .getByCompositeKey(current)
        let new: GameModel? = self.fetchModel(composite)
        if let new: GameModel = new {
            return .init(new.snapshot, false, .add)
        } else {
            let game: GameModel = .init(current)
            self.add(game)
            return .init(current, true, .add)
        }
    }
    
}

private extension ModelContext {
    
    func fetchModel(_ desc: GameFetchDescriptor) -> GameModel? {
        fetchModels(desc).first
    }
    
    func fetchModels(_ desc: GameFetchDescriptor) -> [GameModel] {
        do {
            return try self.fetch(desc)
        } catch {
            print("error: \(error)")
            return .init()
        }
    }
    
}
