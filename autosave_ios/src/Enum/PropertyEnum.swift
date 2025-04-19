//
//  PropertyEnum.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/19/25.
//

import Foundation

public enum PropertyEnum: Enumerable {
    
    case format
    case physical
    case digital
    case system
    case nintendo
    case playstation
    case os
    case xbox
    case mode
    case series
    case developer
    case publisher
    case genre
    
    public var value: String {
        switch self {
        case .playstation: return "PlayStation"
        case .nintendo: return "Nintendo"
        case .xbox: return "Xbox"
        case .os: return "Operating System"
        default: return self.id.capitalized
        }
    }
    
}
