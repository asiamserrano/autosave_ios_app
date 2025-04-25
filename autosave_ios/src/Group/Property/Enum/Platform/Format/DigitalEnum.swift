//
//  DigitalEnum.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/20/25.
//

import Foundation

public enum DigitalEnum {
    case steam, origin, psn, xbox, nintendo, free
}

extension DigitalEnum: Enumerable {
    
    public var display: String {
        switch self {
        case .psn: return "PlayStation Network"
        case .xbox: return "Xbox Live"
        case .nintendo: return "Nintendo eShop"
        case .free: return "DRM-free"
        case .origin: return "Origin"
        case .steam: return "Steam"
        }
    }
    
}

extension DigitalEnum: FormatProtocol {
    
    public var formatEnum: FormatEnum { .digital }
    
}
