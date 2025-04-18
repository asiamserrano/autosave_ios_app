//
//  SortOrder.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/12/25.
//

import Foundation

extension SortOrder: Defaultable, Iterable {
    
    public static var defaultValue: Self { .forward }
    
    public static var cases: [SortOrder] { [.forward, .reverse] }
    
    public var icon: IconEnum {
        switch self {
        case .forward: return .chevron_up
        case .reverse: return .chevron_down
        }
    }
    
}
