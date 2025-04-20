//
//  OSEnum.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/20/25.
//

import Foundation

public enum OSEnum: Enumerable {
    case win, mac
    
    public var value: String {
        switch self {
        case .win: return "Microsoft Windows"
        case .mac: return "Apple macOS"
        }
    }
    
    public var systemEnum: SystemEnum { .os }
    
    public var digitalEnums: [DigitalEnum] {
        [ .steam, .origin, .free ]
    }
    
    public var physicalEnum: PhysicalEnum { .disc }
    
}
