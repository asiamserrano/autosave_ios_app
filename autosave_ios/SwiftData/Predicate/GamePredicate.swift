//
//  GamePredicate.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/9/25.
//

import Foundation
import SwiftData

public typealias GamePredicate = Predicate<GameModel>

extension GamePredicate {
    
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
