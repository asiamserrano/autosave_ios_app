//
//  SystemEnum.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/20/25.
//

import Foundation

public enum SystemEnum {
    case playstation, nintendo, xbox, os
    
}

extension SystemEnum: Enumerable {
    
    public var display: String {
        switch  self {
        case .playstation: return "PlayStation"
        case .nintendo: return "Nintendo"
        case .xbox: return "Xbox"
        case .os: return "Operating System"
        }
    }
    
}
