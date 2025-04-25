//
//  GameResult.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/10/25.
//

import Foundation

public struct GameResult: Hashable, Equatable {
//    let message: String
//    let bool: Bool
    
    public let comparator: Snapshot
    public let successful: Bool
    public let enumeration: Enumeration
    
    public init(_ comparator: Snapshot, _ inserted: Bool, _ enumeration: Enumeration) {
        self.comparator = comparator
        self.successful = inserted
        self.enumeration = enumeration
    }
    
}

public extension GameResult {
        
    enum Enumeration: Enumerable {
        case add, edit
    }
    
    var alert: AlertEnum {
        switch self.enumeration {
        case .add: return .add_game(self)
        case .edit: return .edit_game(self)
        }
    }
    
    var title: String {
        switch self.enumeration {
        case .add: return successful ? "Created Game" : "Failed to Create Game"
        case .edit: return successful ? "Updated Game" : "Failed to Update Game"
        }
    }
    
    var message: String {
        switch self.enumeration {
        case .add:
            let result: String = successful ? "created" : "create"
            return message(result)
        case .edit:
            let result: String = successful ? "updated" : "update"
            return message(result)
        }
    }
    
}

public extension GameResult? {
    
    var alert: AlertEnum {
        if let result = self {
            switch result.enumeration {
            case .add: return .add_game(result)
            case .edit: return .edit_game(result)
            }
        } else {
            return .none
        }
    }
    
}

private extension GameResult {
    
    func message(_ result: String) -> String {
        let display: String = comparator.display
        if successful {
            return "\(display) has been successfully \(result)!"
        } else {
            let location: String = comparator.status.value
            return "Unable to \(result) game. \(display) already exists in your \(location)."
        }
    }
    
}
