////
////  PropertyBuilder.swift
////  autosave_ios
////
////  Created by Asia Serrano on 4/19/25.
//

import Foundation

// TODO: Fix this too
public enum PropertyBuilder {
    
    private enum BuilderEnum: Enumerable {
        case input, platform, mode
    }
    
    public static var random: Self {
        let builderEnum: BuilderEnum = .random
        switch builderEnum {
        case .input: return .input(.init(.random, .random))
        case .mode: return .mode(.init(.random))
        case .platform:
            let system: SystemBuilder = .random
            let format: FormatBuilder = system.formatBuilders.random
            return .platform(.init(system, format))
        }
    }
    
    case input(InputSnapshot)
    case platform(PlatformSnapshot)
    case mode(ModeSnapshot)
    
//    public var groupings: [PropertyGrouping] {
//        switch self {
//        case .input(let i): return .init(i.grouping)
//        case .mode(let m): return .init(m.grouping)
//        case .platform(let p):
//            let a: PropertyGrouping = p.getPropertyGrouping(.system)
//            let b: PropertyGrouping = p.getPropertyGrouping(.format)
//            let c: PropertyGrouping = p.getPropertyGrouping()
//            return .init(a, b, c)
//        }
//    }
    
//    public var grouping: PropertyGrouping {
//        switch self {
//        case .input(let i): return i.grouping
//        case .mode(let m): return m.grouping
//        case .platform(let p): return p.getPropertyGrouping()
////            let a: PropertyGrouping = p.getPropertyGrouping(.system)
////            let b: PropertyGrouping = p.getPropertyGrouping(.format)
////            let c: PropertyGrouping = p.getPropertyGrouping()
////            return .init(a, b, c)
//        }
//    }
    
//    public func getLinkSnapshots(_ game: GameSnapshot) -> [LinkSnapshot] {
////        let array: [LinkSnapshot] = self.grouping.snapshots.getLinkSnapshots(game)
//        switch self {
//        case .platform(let platform):
//            let grouping: PropertyGrouping = platform.getPropertyGrouping()
//            let array: [LinkSnapshot] = grouping.snapshots.getLinkSnapshots(game)
//            
//            let a: LinkSnapshot = platform.getLinkSnapshot(.system)  // for a systemBuilder
//            let b: LinkSnapshot = platform.getLinkSnapshot(.format)  // for a formatBuilder
//            let c: LinkSnapshot = platform.getLinkSnapshot()         // for a platform (systemBuilder + formatBuilder)
//            let d: LinkSnapshot = platform.getLinkSnapshot(game)     // for a game + platform
//        
//            return [a, b, c, d] + array
//        default:
//            return self.groupings.flatMap(\.snapshots).getLinkSnapshots(game)
//        }
//    }
    
//    public var grouping: PropertyGrouping {
//        switch self {
//        case .input(let i): return .single(i.snapshot)
//        case .mode(let m): return .single(m.snapshot)
//        case .platform(let p): return .platform(p)
//        }
//    }
    
//    public func getLinkBuilder(_ game: GameSnapshot) -> LinkBuilder {
//        switch self {
//        case .input(let i):
//            let property: PropertySnapshot = i.snapshot
//            return .game_property(game, property)
//        case .platform(let p):
//            
//        case .mode(let m):
//            let property: PropertySnapshot = m.snapshot
//            return .game_property(game, property)
//        }
//    }
    
}

/*
 //    public static func system(_ builder: SystemBuilder) -> Self {
 //        let builder: LinkBuilder = .property_pair(builder.key, builder.value)
 //        return .init(.system, builder)
 //    }
 //
 //    public static func format(_ builder: FormatBuilder) -> Self {
 //        let builder: LinkBuilder = .property_pair(builder.key, builder.value)
 //        return .init(.format, builder)
 //    }
 */

/*
 case property_pair(PropertySnapshot, PropertySnapshot)  // systembuilder or formatbuilder
 case link_pair(LinkSnapshot, LinkSnapshot)              // platformbuilder
 case game_property(GameSnapshot, PropertySnapshot)      // propertybuilder except platformbuilder
 case game_platform(GameSnapshot, LinkSnapshot)          // platformbuilder
 
 You say I need to create 8 instances of link builder.
 1. G + SG          game_property
 2. G + SN          game_property
 3. G + FG          game_property
 4. G + FN          game_property
 5. SG + SN -> S    property_pair
 6. FG + FN -> G    property_pair
 7. S + F -> PL     link_pair
 8. G + PL          game_platform
 */
