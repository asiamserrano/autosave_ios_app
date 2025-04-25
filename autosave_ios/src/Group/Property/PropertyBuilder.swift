////
////  PropertyBuilder.swift
////  autosave_ios
////
////  Created by Asia Serrano on 4/19/25.
//

import Foundation

public enum PropertyBuilder {
        
    case format(FormatEnum)
    case physical(PhysicalEnum)
    case digital(DigitalEnum)
    case system(SystemEnum)
    case nintendo(NintendoEnum)
    case playstation(PlayStationEnum)
    case os(OSEnum)
    case xbox(XboxEnum)
    case mode(ModeEnum)
    case series(String)
    case developer(String)
    case publisher(String)
    case genre(String)
    
}

public extension PropertyBuilder {
    
    static func random(_ property: PropertyEnum) -> Self {
        switch property {
        case .format: return .format(.random)
        case .physical: return .physical(.random)
        case .digital: return .digital(.random)
        case .system: return .system(.random)
        case .nintendo: return .nintendo(.random)
        case .playstation: return .playstation(.random)
        case .os: return .os(.random)
        case .xbox: return .xbox(.random)
        case .mode: return .mode(.random)
        case .series: return .series(.random)
        case .developer: return .developer(.random)
        case .publisher: return .publisher(.random)
        case .genre: return .genre(.random)
        }
    }
    
//    var key: ValueBuilder {
//        .init(self.type)
//    }
    
    var type: PropertyEnum {
        switch self {
        case .format: return .format
        case .physical: return .physical
        case .digital: return.digital
        case .system: return .system
        case .nintendo: return .nintendo
        case .playstation: return.playstation
        case .os: return .os
        case .xbox: return .xbox
        case .mode: return .mode
        case .series: return .series
        case .developer: return .developer
        case .publisher: return .publisher
        case .genre: return .genre
        }
    }
    
//    var value: ValueBuilder {
//        switch self {
//        case .format(let formatEnum): return .init(formatEnum)
//        case .physical(let physicalEnum): return .init(physicalEnum)
//        case .digital(let digitalEnum): return .init(digitalEnum)
//        case .system(let systemEnum): return .init(systemEnum)
//        case .nintendo(let nintendoEnum): return .init(nintendoEnum)
//        case .playstation(let playStationEnum): return .init(playStationEnum)
//        case .os(let oSEnum): return .init(oSEnum)
//        case .xbox(let xboxEnum): return .init(xboxEnum)
//        case .mode(let modeEnum): return .init(modeEnum)
//        case .series(let string): return .init(string)
//        case .developer(let string): return .init(string)
//        case .publisher(let string): return .init(string)
//        case .genre(let string): return .init(string)
//        }
//    }
    
}

