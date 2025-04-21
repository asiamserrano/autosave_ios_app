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
//    static func build() -> Self {
//        let descriptors: [SortDescriptor<T>] = .defaultValue
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
        let title_canon: String = comparator.title_canon
        let release_date: String = comparator.release_date
        let predicate: GamePredicate = .getByCompositeKey(title_canon, release_date)
        return .init(predicate: predicate, sortBy: .defaultValue)
    }
    
    static func getByUUID(_ comparator: GameSnapshot) -> Self {
        let uuid: UUID = comparator.uuid
        let predicate: GamePredicate = .getByUUID(uuid)
        return .init(predicate: predicate, sortBy: .defaultValue)
    }
    
    static func getByStatus(_ status: GameStatusEnum) -> Self {
        let bool = status.bool
        let predicate: GamePredicate = .getForList(bool, .defaultValue)
        return .init(predicate: predicate, sortBy: .defaultValue)
    }
    
    static func getByJunctions(_ junctions: [JunctionModel]) -> Self {
        let uuids: [UUID] = junctions.compactMap(\.game_uuid)
        let predicate: GamePredicate = .getByUUIDs(uuids)
        return .init(predicate: predicate, sortBy: .defaultValue)
    }
    
}

public typealias PropertyFetchDescriptor = FetchDescriptor<PropertyModel>

public extension PropertyFetchDescriptor {
    
    static func getByCompositeKey(_ snapshot: PropertySnapshot) -> Self {
        let type_id: String = snapshot.type.id
        let value_canon: String = snapshot.value.canon
        let predicate: PropertyPredicate = .getByCompositeKey(type_id, value_canon)
        return .init(predicate: predicate, sortBy: .defaultValue)
    }
    
}

public typealias JunctionFetchDescriptor = FetchDescriptor<JunctionModel>

public extension JunctionFetchDescriptor {
    
    static func getByCompositeKey(_ snapshot: JunctionSnapshot) -> Self {
        let uuid_1: UUID? = snapshot.game?.uuid
        let uuid_2: UUID? = snapshot.property?.uuid
        let predicate: JunctionPredicate = .getByCompositeKey(uuid_1, uuid_2)
        return .init(predicate: predicate, sortBy: .defaultValue)
    }
    
    static func getByGame(_ game: GameModel) -> Self {
        let uuid: UUID? = game.uuid
        let predicate: JunctionPredicate = .getByGame(uuid)
        return .init(predicate: predicate, sortBy: .defaultValue)
    }
    
    static func getByProperty(_ property: PropertyModel) -> Self {
        let uuid: UUID? = property.uuid
        let predicate: JunctionPredicate = .getByProperty(uuid)
        return .init(predicate: predicate, sortBy: .defaultValue)
    }
    
}
