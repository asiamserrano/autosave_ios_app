//
//  PropertySnapshot.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/19/25.
//

import Foundation

//public enum PropertySnapshot {
//        
//    case format(FormatEnum)
//    case physical(PhysicalEnum)
//    case digital(DigitalEnum)
//    case system(SystemEnum)
//    case nintendo(NintendoEnum)
//    case playstation(PlayStationEnum)
//    case os(OSEnum)
//    case xbox(XboxEnum)
//    case mode(ModeEnum)
//    case series(String)
//    case developer(String)
//    case publisher(String)
//    case genre(String)
//    
//}
//
//public extension PropertySnapshot {
//    
//    static func random(_ property: PropertyEnum) -> Self {
//        switch property {
//        case .format: return .format(.random)
//        case .physical: return .physical(.random)
//        case .digital: return .digital(.random)
//        case .system: return .system(.random)
//        case .nintendo: return .nintendo(.random)
//        case .playstation: return .playstation(.random)
//        case .os: return .os(.random)
//        case .xbox: return .xbox(.random)
//        case .mode: return .mode(.random)
//        case .series: return .series(.random)
//        case .developer: return .developer(.random)
//        case .publisher: return .publisher(.random)
//        case .genre: return .genre(.random)
//        }
//    }
//    
//    var key: ValueEnum {
//        .enumerable(self.type)
//    }
//    
//    var type: PropertyEnum {
//        switch self {
//        case .format: return .format
//        case .physical: return .physical
//        case .digital: return.digital
//        case .system: return .system
//        case .nintendo: return .nintendo
//        case .playstation: return.playstation
//        case .os: return .os
//        case .xbox: return .xbox
//        case .mode: return .mode
//        case .series: return .series
//        case .developer: return .developer
//        case .publisher: return .publisher
//        case .genre: return .genre
//        }
//    }
//    
//    var value: ValueEnum {
//        switch self {
//        case .format(let formatEnum): return .enumerable(formatEnum)
//        case .physical(let physicalEnum): return .enumerable(physicalEnum)
//        case .digital(let digitalEnum): return .enumerable(digitalEnum)
//        case .system(let systemEnum): return .enumerable(systemEnum)
//        case .nintendo(let nintendoEnum): return .enumerable(nintendoEnum)
//        case .playstation(let playStationEnum): return .enumerable(playStationEnum)
//        case .os(let oSEnum): return .enumerable(oSEnum)
//        case .xbox(let xboxEnum): return .enumerable(xboxEnum)
//        case .mode(let modeEnum): return .enumerable(modeEnum)
//        case .series(let string): return .string(string)
//        case .developer(let string): return .string(string)
//        case .publisher(let string): return .string(string)
//        case .genre(let string): return .string(string)
//        }
//    }
//    
//}
