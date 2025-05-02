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
    
    var formatBuilders: [FormatBuilder] {
        let d: [FormatBuilder] = self.digitalEnums.map(FormatBuilder.digital)
        let p: FormatBuilder = .physical(self.physicalEnum)
        return .init(p) + d
    }
    
}
