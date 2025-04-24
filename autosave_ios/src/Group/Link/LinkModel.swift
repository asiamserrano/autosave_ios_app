//
//  JunctionModel.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/20/25.
//

import Foundation
import SwiftData

@Model
public class LinkModel {
    
//    public private(set) var type_id: String
    public private(set) var uuid: UUID
    public private(set) var key: UUID
    public private(set) var value: UUID
    public private(set) var type: String
    
    public init(_ builder: LinkBuilder, _ type: LinkEnum) {
        self.uuid = .init()
        self.key = builder.key
        self.value = builder.value
        self.type = type.id
    }
    
}

public enum LinkEnum: Enumerable {
    case system // systemBuilder
    case format // formatBuilder
    case platform // system + format
    case property // game + property
    case link // game + platform
}

public enum LinkBuilder {
    
    case game(GameModel, PropertyModel) // game + property
    case property(PropertyModel, PropertyModel) // property + property
    case platform(GameModel, LinkModel) // game + link

    var key: UUID {
        switch self {
        case .game(let g, _), .platform(let g, _): return g.uuid
        case .property(let p, _): return p.uuid
        }
    }
    
    var value: UUID {
        switch self {
        case .game(_, let p), .property(_, let p): return p.uuid
        case .platform(_, let l): return l.uuid
        }
    }
    
}

public struct LinkSnapshot {
    let key: 
    let type: LinkEnum
}



//public struct JunctionSnapshot {
//    
//    let game: GameModel?
//    let property: PropertyModel?
//    
//    public init(_ game: GameModel, _ property: PropertyModel) {
//        self.game = game
//        self.property = property
//    }
//    
//}
