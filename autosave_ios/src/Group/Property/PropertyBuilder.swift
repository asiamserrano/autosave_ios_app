////
////  PropertyBuilder.swift
////  autosave_ios
////
////  Created by Asia Serrano on 4/19/25.
//

import Foundation

public enum PropertyBuilder {
    case input(InputSnapshot)
    case platform(PlatformSnapshot)
    case mode(ModeSnapshot)
    
    public var grouping: PropertyGrouping {
        switch self {
        case .input(let i): return .single(i.snapshot)
        case .mode(let m): return .single(m.snapshot)
        case .platform(let p): return .platform(p)
        }
    }
    
//    public var links: LinkGrouping {
//        switch self {
//        case .input, .mode: return .none
//        case .platform(let p): return .platform(p)
//        }
//    }
    
}
