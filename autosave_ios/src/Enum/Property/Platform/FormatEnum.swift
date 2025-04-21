//
//  FormatEnum.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/20/25.
//

import Foundation

public enum FormatEnum: Enumerable {
    case digital, physical
}

public extension FormatEnum {
    
    var icon: IconEnum {
        switch self {
        case .digital: return .arrow_down_circle_fill
        case .physical: return .opticaldisc_fill
        }
    }
    
    func builder(_ id: String) -> FormatBuilder {
        switch self {
        case .digital: return .digital(.init(id))
        case .physical: return .physical(.init(id))
        }
    }
    
//
//    func equals(_ builder: FormatBuilder) -> Bool {
//        self == builder.formatEnum
//    }
    
}
