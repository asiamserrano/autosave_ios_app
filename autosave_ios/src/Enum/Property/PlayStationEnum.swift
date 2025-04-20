//
//  PlayStationEnum.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/20/25.
//

import Foundation

public enum PlayStationEnum: Enumerable {
    
    case ps1, ps2, ps3, ps4, ps5, psp
    
    public var value: String {
        
        var end: String {
            if let ch: Character = self.id.last, let i: Int = Int(String(ch)) {
                return i == 1 ? .defaultValue : i.description
            } else { return "Portable" }
        }
        
        return "\(self.systemEnum.value) \(end)".trim()
    }
    
    public var systemEnum: SystemEnum { .playstation }
    
    public var digitalEnums: [DigitalEnum] {
        switch self {
        case .ps3, .ps4, .ps5: return [ .free, .psn ]
        case .psp: return [ .free ]
        default: return []
        }
    }
    
    public var physicalEnum: PhysicalEnum { .disc }
    
}
