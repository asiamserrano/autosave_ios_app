//
//  OSEnum.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/20/25.
//

import Foundation

public enum OSEnum {
    case win, mac
}

extension OSEnum: Enumerable {
    
    public var value: String {
        switch self {
        case .win: return "Microsoft Windows"
        case .mac: return "Apple macOS"
        }
    }
    
}

extension OSEnum: SystemProtocol {
    
    public var systemEnum: SystemEnum { .os }

    public var physicalEnum: PhysicalEnum { .disc }

    public var digitalEnums: [DigitalEnum] {
        [ .steam, .origin, .free ]
    }
    
}
