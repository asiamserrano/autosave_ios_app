//
//  ModelContext.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/4/25.
//

import Foundation
import SwiftData

extension ModelContext {
    
    public func add(_ item: Item) -> Void {
        self.insert(item)
        self.store()
    }
    
    public func remove(_ item: Item) -> Void {
        self.delete(item)
        self.store()
    }
    
    private func store() {
        do {
            try self.save()
        } catch let error {
            fatalError("error saving in model context: \(error.localizedDescription)")
        }
    }
    
}
