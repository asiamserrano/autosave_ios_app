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
    
//    public static func getForList(_ status: GameStatusEnum, _ search: String) -> GamePredicate {
//        let canon = search.canonicalize()
//        let bool = status.bool
//        switch canon.count {
//        case 0: return #Predicate { $0.status_bool == bool }
//        case 1: return #Predicate { $0.status_bool == bool && $0.title_canon.starts(with: canon) }
//        default: return #Predicate { $0.status_bool == bool && $0.title_canon.contains(canon) }
//        }
//    }
    
    public static func getForList(_ bool: Bool, _ canon: String) -> GamePredicate {
        switch canon.count {
        case 0: return #Predicate { $0.status_bool == bool }
        case 1: return #Predicate { $0.status_bool == bool && $0.title_canon.starts(with: canon) }
        default: return #Predicate { $0.status_bool == bool && $0.title_canon.contains(canon) }
        }
    }
    
    public static func getByCompositeKey(_ title_canon: String, _ release_date: String) -> GamePredicate {
        #Predicate {
            $0.title_canon == title_canon && $0.release_date == release_date
        }
    }
    
    public static func getByUUID(_ uuid: UUID) -> GamePredicate {
        #Predicate {
            $0.uuid == uuid
        }
    }
    
    public static func getByUUIDs(_ uuids: [UUID]) -> GamePredicate {
        #Predicate {
            uuids.contains($0.uuid)
        }
    }
    
//    public static func getByCompositeKey(_ comparator: GameSnapshot) -> GamePredicate {
//        let title_canon: String = comparator.title_canon
//        let release_date: String = comparator.release_date
//        return #Predicate {
//            $0.title_canon == title_canon && $0.release_date == release_date
//        }
//    }
    
//    public static func getByUUID(_ comparator: GameSnapshot) -> GamePredicate {
//        let uuid: UUID = comparator.uuid
//        return #Predicate {
//            $0.uuid == uuid
//        }
//    }
    
}

public typealias PropertyPredicate = Predicate<PropertyModel>

extension PropertyPredicate {
    
    public static func getByCompositeKey(_ type_id: String, _ value_canon: String) -> PropertyPredicate {
        #Predicate {
            $0.type_id == type_id && $0.value_canon == value_canon
        }
    }
    
}

public typealias LinkPredicate = Predicate<LinkModel>

extension LinkPredicate {
    
    public static func getByCompositeKey(_ key_uuid: UUID, _ value_uuid: UUID) -> LinkPredicate {
        #Predicate {
            $0.key_uuid == key_uuid && $0.value_uuid == value_uuid
        }
    }
    
    public static func getByKey(_ key_uuid: UUID, _ type_id: String? = nil) -> LinkPredicate {
        if let type_id: String = type_id {
            return #Predicate {
                $0.key_uuid == key_uuid && $0.type_id == type_id
            }
        } else {
            return #Predicate {
                $0.key_uuid == key_uuid
            }
        }
    }
    
    public static func getByValue(_ value_uuid: UUID, _ type_id: String? = nil) -> LinkPredicate {
        if let type_id: String = type_id {
            return #Predicate {
                $0.value_uuid == value_uuid && $0.type_id == type_id
            }
        } else {
            return #Predicate {
                $0.value_uuid == value_uuid
            }
        }
    }
    
//    public static func getByEnum(_ game_uuid: UUID?, _ property_uuid: UUID?) -> JunctionPredicate {
//        #Predicate {
//            $0.game_uuid == game_uuid && $0.property_uuid == property_uuid
//        }
//    }
    
}
