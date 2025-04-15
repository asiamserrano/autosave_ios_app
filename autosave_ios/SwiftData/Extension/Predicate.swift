//
//  Predicate.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/12/25.
//

import Foundation
import SwiftData

public typealias GamePredicate = Predicate<GameModel>

extension GamePredicate {
    
    public static func getForList(_ status: GameStatusEnum, _ canon: String) -> GamePredicate {
        let bool = status.bool
        switch canon.count {
        case 0: return #Predicate { $0.status_bool == bool }
        case 1: return #Predicate { $0.status_bool == bool && $0.title_canon.starts(with: canon) }
        default: return #Predicate { $0.status_bool == bool && $0.title_canon.contains(canon) }
        }
    }
    
    public static func getByCompositeKey(_ comparator: GameComparator) -> GamePredicate {
        let title_canon: String = comparator.title_canon
        let release_date: String = comparator.release_date
        return #Predicate {
            $0.title_canon == title_canon && $0.release_date == release_date
        }
    }
    
    public static func getByUUID(_ comparator: GameComparator) -> GamePredicate {
        let uuid: UUID = comparator.uuid
        return #Predicate {
            $0.uuid == uuid
        }
    }
    
}
