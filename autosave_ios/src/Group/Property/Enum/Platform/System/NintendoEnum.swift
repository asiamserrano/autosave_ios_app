//
//  NintendoEnum.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/20/25.
//

import Foundation

public enum NintendoEnum {
    case snes, nsw, wii, wiiu, gamecube, n3ds
}

extension NintendoEnum: Enumerable {
    
    public var display: String {
        let name: String = self.systemEnum.display
        switch self {
        case .snes: return "Super \(name) Entertainment System"
        case .nsw: return "\(name) Switch"
        case .wii: return "Wii"
        case .wiiu : return "Wii U"
        case .gamecube: return "GameCube"
        case .n3ds: return "\(name) 3DS"
        }
    }
    
}

extension NintendoEnum: SystemProtocol {
    
    public var systemEnum: SystemEnum { .nintendo }
    
    public var physicalEnum: PhysicalEnum {
        switch self {
        case .snes: return .cartridge
        case .nsw, .n3ds: return .card
        default: return .disc
        }
    }
    
    public var digitalEnums: [DigitalEnum] {
        switch self {
        case .nsw: return [ .nintendo ]
        default: return []
        }
    }
    
}
