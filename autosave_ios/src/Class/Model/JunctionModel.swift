//
//  JunctionModel.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/20/25.
//

import Foundation
import SwiftData

@Model
public class JunctionModel {
    
//    public private(set) var type_id: String
    public private(set) var uuid: UUID
    public private(set) var game_uuid: UUID?
    public private(set) var property_uuid: UUID?
    
    public init(_ snapshot: JunctionSnapshot) {
        self.uuid = .init()
        self.game_uuid = snapshot.game?.uuid
        self.property_uuid = snapshot.property?.uuid
    }
    
}

public struct JunctionSnapshot {
    
    let game: GameModel?
    let property: PropertyModel?
    
    public init(_ game: GameModel, _ property: PropertyModel) {
        self.game = game
        self.property = property
    }
    
}

//public enum JunctionEnum: Enumerable {
//    case game, platform, property
//}
