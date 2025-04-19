//
//  FetchDescriptor.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/9/25.
//

import Foundation
import SwiftData

//private extension FetchDescriptor where T: Any {
//        
//    static func build(_ predicate: Predicate<T>?) -> Self {
//        let descriptors: [SortDescriptor<T>] = .init()
//        if let pred: Predicate<T> = predicate {
//            return .init(predicate: pred, sortBy: descriptors)
//        } else {
//            return .init(sortBy: descriptors)
//        }
//    }
//    
//}

public typealias GameFetchDescriptor = FetchDescriptor<GameModel>

public extension GameFetchDescriptor {
    
    static func getByCompositeKey(_ comparator: GameSnapshot) -> Self {
        let predicate: GamePredicate = .getByCompositeKey(comparator)
        return .init(predicate: predicate, sortBy: .init())
    }
    
    static func getByUUID(_ comparator: GameSnapshot) -> Self {
        let predicate: GamePredicate = .getByUUID(comparator)
        return .init(predicate: predicate, sortBy: .init())
    }
    
    static func getByStatus(_ status: GameStatusEnum) -> Self {
        let predicate: GamePredicate = .getForList(status, .defaultValue)
        return .init(predicate: predicate, sortBy: .init())
    }
    
}

public typealias PropertyFetchDescriptor = FetchDescriptor<PropertyModel>

public extension PropertyFetchDescriptor {
    
    static func getByCompositeKey(_ snapshot: PropertySnapshot) -> Self {
        let type_id: String = snapshot.type.id
        let value_canon: String = snapshot.value.canon
        let predicate: PropertyPredicate = .getByCompositeKey(type_id, value_canon)
        return .init(predicate: predicate, sortBy: .init())
    }
    
}
