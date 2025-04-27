//
//  SystemEnum.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/20/25.
//

import Foundation

public enum SystemEnum: Enumerable {
    case playstation, nintendo, xbox, os
    
    public var display: String {
        self.property.display
    }
    
}

public extension SystemEnum {
    
    var property: PropertyEnum {
        switch self {
        case .playstation: return .playstation
        case .nintendo: return .nintendo
        case .xbox: return .xbox
        case .os: return .os
        }
    }
    
}
