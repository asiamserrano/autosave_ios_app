////
////  ModelEnum.swift
////  autosave_ios
////
////  Created by Asia Serrano on 4/26/25.
////
//
//import Foundation
//
//public enum ModelEnum: Enumerable {
//    case game, property, link
//}
//
//public enum ModelBuilder {
//    case game( GameSnapshot )
//    case property( PropertySnapshot )
//    case link( LinkSnapshot )
//
//    /// grab the UUID no matter what you carry
//    public var uuid: UUID {
//        switch self {
//        case .game(let g):     return g.uuid
//        case .property(let p): return p.uuid
//        case .link(let  l):    return l.uuid
//        }
//    }
//    
//    public var type: ModelEnum {
//        switch self {
//        case .game:     return .game
//        case .property: return .property
//        case .link:    return .link
//        }
//    }
//    
//}
//
//public struct ModelSnapshot {
//   
//    let type: ModelEnum
//    let uuid: UUID
//    
//    public init(_ builder: ModelBuilder) {
//        self.type = builder.type
//        self.uuid = builder.uuid
//    }
//    
//    public var type_id: String {
//        self.type.id
//    }
//    
//}
//
////public enum ModelGrouping {
////    case link(LinkSnapshot, LinkSnapshot)
////    case property(PropertySnapshot, PropertySnapshot)
////    case game(GameSnapshot, PropertySnapshot)
////    case platform(GameSnapshot, LinkSnapshot)
////    
////    public var key: UUID {
////        switch self {
////        case .property(let p, _): return p.uuid
////        case .game(let g, _): return g.uuid
////        case .platform(let g, _): return g.uuid
////        case .link(let l, _): return l.uuid
////        }
////    }
////    
////    public var value: UUID {
////        switch self {
////        case .property(_, let p): return p.uuid
////        case .game(_, let p): return p.uuid
////        case .platform(_, let l): return l.uuid
////        case .link(_, let l): return l.uuid
////        }
////    }
////    
////}
