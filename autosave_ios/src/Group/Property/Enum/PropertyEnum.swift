//
//  PropertyEnum.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/19/25.
//

import Foundation

//public enum PropertyEnum: Enumerable {
//    
//    case series
//    case developer
//    case publisher
//    case genre
//    case format
//    case physical
//    case digital
//    case system
//    case nintendo
//    case playstation
//    case os
//    case xbox
//    case mode
//    
//    public var display: String {
//        switch self {
//        case .playstation: return "PlayStation"
//        case .nintendo: return "Nintendo"
//        case .xbox: return "Xbox"
//        case .os: return "Operating System"
//        default: return self.id.capitalized
//        }
//    }
//    
//}

public enum PropertyEnum: Enumerable {
    case series
    case developer
    case publisher
    case genre
    case mode
    case system    // will be decomposed by PlatformBuilder
    case format    // ditto for formats
}

public class Property {
    
    public enum Key {
        case series
        case developer
        case publisher
        case genre
        case format
        case physical
        case digital
        case system
        case nintendo
        case playstation
        case os
        case xbox
        case mode
    }
    
    public enum Value {
        case string(InputEnum, String)
        case format(FormatEnum)
        case physical(PhysicalEnum)
        case digital(DigitalEnum)
        case mode(ModeEnum)
        case playstation(PlayStationEnum)
        case nintendo(NintendoEnum)
        case os(OSEnum)
        case xbox(XboxEnum)
        
        public var key: Key {
            switch self {
            case .string(let input, _):
                switch input {
                case .series: return .series
                case .developer: return .developer
                case .publisher: return .publisher
                case .genre: return .genre
                }
            case .format: return .format
            case .physical: return .physical
            case .digital: return .digital
            case .mode: return .mode
            case .playstation: return .playstation
            case .nintendo: return .nintendo
            case .os: return .os
            case .xbox: return .xbox
            }
        }
        
        public var display: Display {
            switch self {
            case .string(_, let string): return .init(string)
            case .format(let formatEnum): return .init(formatEnum)
            case .physical(let physicalEnum): return .init(physicalEnum)
            case .digital(let digitalEnum): return .init(digitalEnum)
            case .mode(let modeEnum): return .init(modeEnum)
            case .playstation(let playStationEnum): return .init(playStationEnum)
            case .nintendo(let nintendoEnum): return .init(nintendoEnum)
            case .os(let oSEnum): return .init(oSEnum)
            case .xbox(let xboxEnum): return .init(xboxEnum)
            }
        }
        
    }
    
   
    
    
}


/// wraps the two “parts” of a platform entry
public enum PlatformComponent {
    case system(SystemBuilder)
    case format(FormatEnum)
    
    var propertyEnum: Prop
}

/// the real builder that produces a full 4-property platform
public struct PlatformBuilder {
    let system: SystemBuilder
    let format: FormatEnum
}

public struct PlatformSnapshot {
    let system: Display
    let format: Display
}
