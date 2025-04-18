//
//  MenuEnum.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/12/25.
//

import Foundation

public enum MenuEnum: Enumerable {
    case library
    case wishlist
    case properties
}

public extension MenuEnum {
    
    var icon: IconEnum {
        switch self {
        case .properties: return .list_clipboard
        case .wishlist: return .list_star
        case .library: return .gamecontroller
        }
    }
    
}
