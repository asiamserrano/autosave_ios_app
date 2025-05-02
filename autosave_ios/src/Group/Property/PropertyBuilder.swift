//
//  PropertyBuilder.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/19/25.


import Foundation

public enum PropertyBuilder {
    
    case input(InputEnum, String)
    case mode(ModeEnum)
    case system(SystemEnum)
    case format(FormatEnum)
    case nintendo(NintendoEnum)
    case playstation(PlayStationEnum)
    case os(OSEnum)
    case xbox(XboxEnum)
    case physical(PhysicalEnum)
    case digital(DigitalEnum)
    
}

public extension PropertyBuilder {
    
    static var random: Self {
        switch PropertyEnum.random {
        case .series: return .input(.series, .random)
        case .developer: return .input(.developer, .random)
        case .publisher: return .input(.publisher, .random)
        case .genre: return .input(.genre, .random)
        case .mode: return .mode(.random)
        case .system: return .system(.random)
        case .format: return .format(.random)
        case .physical: return .physical(.random)
        case .digital: return .digital(.random)
        case .nintendo: return .nintendo(.random)
        case .playstation: return .playstation(.random)
        case .os: return .os(.random)
        case .xbox: return .xbox(.random)
        }
    }
    
    var propertyEnum: PropertyEnum {
        switch self {
        case .input(let inputEnum, _):
            switch inputEnum {
            case .series: return .series
            case .developer: return .developer
            case .publisher: return .publisher
            case .genre: return .genre
            }
        case .mode: return .mode
        case .system: return.system
        case .format: return .format
        case .playstation: return .playstation
        case .nintendo: return .nintendo
        case .xbox: return .xbox
        case .os: return .os
        case .digital: return .digital
        case .physical: return .physical
        }
    }
    
    var display: Display {
        switch self {
        case .input(_, let string): return .init(string)
        case .format(let formatEnum): return .init(formatEnum)
        case .physical(let physicalEnum): return .init(physicalEnum)
        case .digital(let digitalEnum): return .init(digitalEnum)
        case .mode(let modeEnum): return .init(modeEnum)
        case .playstation(let playStationEnum): return .init(playStationEnum)
        case .nintendo(let nintendoEnum): return .init(nintendoEnum)
        case .os(let oSEnum): return .init(oSEnum)
        case .xbox(let xboxEnum): return .init(xboxEnum)
        case .system(let systemEnum): return .init(systemEnum)
        }
    }

}
