//
//  GameStatusEnum.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/10/25.
//

import Foundation

public enum GameStatusEnum: Enumerable {
    case library, wishlist
}

public extension GameStatusEnum {
    
    init(_ bool: Bool) {
        switch bool {
        case true: self = .library
        case false: self = .wishlist
        }
    }
    
    var bool: Bool {
        switch self {
        case .library: return true
        case .wishlist: return false
        }
    }
    
}
