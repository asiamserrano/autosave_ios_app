//
//  PropertyEnum.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/19/25.
//

import Foundation

public enum PropertyEnum: Enumerable {
    
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
    
    public var display: String {
        switch self {
        case .playstation: return "PlayStation"
        case .nintendo: return "Nintendo"
        case .xbox: return "Xbox"
        case .os: return "Operating System"
        default: return self.id.capitalized
        }
    }
    
}

public enum InputEnum: Enumerable {
    case series
    case developer
    case publisher
    case genre
}
