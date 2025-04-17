//
//  FetchDescriptor.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/9/25.
//

import Foundation
import SwiftData

public typealias GameFetchDescriptor = FetchDescriptor<GameModel>

private extension FetchDescriptor where T: Any {
        
    static func build(_ predicate: Predicate<T>?) -> Self {
        let descriptors: [SortDescriptor<T>] = .init()
        if let pred: Predicate<T> = predicate {
            return .init(predicate: pred, sortBy: descriptors)
        } else {
            return .init(sortBy: descriptors)
        }
    }
    
}

public extension GameFetchDescriptor {
    
    static func getByCompositeKey(_ comparator: GameSnapshot) -> Self {
        let predicate: GamePredicate = .getByCompositeKey(comparator)
        return .build(predicate)
    }
    
    static func getByUUID(_ comparator: GameSnapshot) -> Self {
        let predicate: GamePredicate = .getByUUID(comparator)
        return .build(predicate)
    }
    
    static func getByStatus(_ status: GameStatusEnum) -> Self {
        let predicate: GamePredicate = .getForList(status, .defaultValue)
        return .build(predicate)
    }
    
}
