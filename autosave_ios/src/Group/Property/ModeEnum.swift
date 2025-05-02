//
//  ModeEnum.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/20/25.
//

import Foundation

public enum ModeEnum {
    
    case single, two, multi
    
}

extension ModeEnum: Enumerable {
    
    public var display: String {
        switch self {
        case .single: return "Single-Player"
        case .two: return "Two-Player"
        case .multi: return "Multiplayer"
        }
    }
    
    public var icon: IconEnum {
        switch self {
        case .single: return .person_fill
        case .two: return .person_2_fill
        case .multi: return .person_3_fill
        }
    }
    
}
