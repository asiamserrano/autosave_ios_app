//
//  SystemBuilder.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/21/25.
//

import Foundation

public enum SystemBuilder {
    case playstation(PlayStationEnum)
    case nintendo(NintendoEnum)
    case xbox(XboxEnum)
    case os(OSEnum)
}

extension SystemBuilder: Enumerable {
    
    public static var allCases: [Self] {
      SystemEnum.allCases.flatMap { category in
        switch category {
          case .playstation:
            return PlayStationEnum.cases.map(Self.playstation)
          case .nintendo:
            return NintendoEnum.cases.map(Self.nintendo)
          case .xbox:
            return XboxEnum.cases.map(Self.xbox)
          case .os:
            return OSEnum.cases.map(Self.os)
        }
      }
    }
    
    public var id: String {
        switch self {
        case .playstation(let e): return e.id
        case .nintendo(let e): return e.id
        case .xbox(let e): return e.id
        case .os(let e): return e.id
        }
    }
    
    public var display: String {
        let name: String = self.systemEnum.display
        switch self {
        case .playstation(let e): return "\(name) \(e.end)"
        case .nintendo(let e): return e.display(name)
        case .xbox(let e): return "\(name) \(e.end)"
        case .os(let e):
            switch e {
            case .win: return "Microsoft Windows"
            case .mac: return "Apple macOS"
            }
        }
    }
    
}

public extension SystemBuilder {
    
    var physicalEnum: PhysicalEnum {
        switch self {
        case .nintendo(let n):
            switch n {
            case .nsw, .n3ds: return .card
            case .snes: return .cartridge
            default: return .disc
            }
        default: return .disc
        }
    }
    
    var digitalEnums: [DigitalEnum] {
        switch self {
        case .playstation(let p):
            switch p {
            case .ps3, .ps4, .ps5: return .init(.free, .psn)
            case .psp: return .init(.free)
            default: return .defaultValue
            }
        case .nintendo(let n):
            switch n {
            case .nsw: return .init(.nintendo)
            default: return .defaultValue
            }
        case .xbox(let x):
            switch x {
            case .xbox: return .defaultValue
            case .x360, .one: return .init(.free, .xbox)
            }
        case .os: return .init(.steam, .origin, .free)
        }
    }
    
    var systemEnum: SystemEnum {
        switch self {
        case .playstation: return .playstation
        case .nintendo: return .nintendo
        case .xbox: return .xbox
        case .os: return .os
        }
    }
    
    var propertyEnum: PropertyEnum {
        self.systemEnum.propertyEnum
    }
    
    var formatBuilders: [FormatBuilder] {
        let d: [FormatBuilder] = self.digitalEnums.map(FormatBuilder.digital)
        let p: FormatBuilder = .physical(self.physicalEnum)
        return .init(p) + d
    }
    
//    var propertyEnum: PropertyEnum {
//        .init(self.systemEnum)
//    }
//    
//    var key: PropertySnapshot {
//        let builder: ValueBuilder = .init(self.propertyEnum)
//        return .init(.system, builder)
//    }
//    
//    var value: PropertySnapshot {
//        .init(self.propertyEnum, self.builder)
//    }
//    
//    var linkBuilder: LinkBuilder {
//        .property_pair(self.key, self.value)
//    }
//    
//    var linkSnapshot: LinkSnapshot {
//        .init(.system, self.linkBuilder)
//    }
    
}
