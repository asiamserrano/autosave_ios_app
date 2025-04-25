//
//  GameSortEnum.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/12/25.
//

import Foundation
import SwiftUI

public enum GameSortEnum: Identifiable, Hashable, Equatable {
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.enum == rhs.enum
    }
        
    case release(SortOrder)
    case title(SortOrder)
    
    public var id: String { self.enum.id }
       
}

extension GameSortEnum: Iterable {
    
    public static var cases: [GameSortEnum] { [.title(.defaultValue), .release(.defaultValue)] }
        
    // toggles the current sort variable between ascending and descending
    public func toggle(_ other: Self) -> Self {
        if self == other {
            switch self {
            case .release(let o): return .release(o.next)
            case .title(let o): return .title(o.next)
            }
        } else {
            switch self {
            case .release(_): return .title(.forward)
            case .title(_): return .release(.forward)
            }
        }
    }
    
    // current sort order for the variable
    public var order: SortOrder {
        switch self {
        case .release(let sortOrder): return sortOrder
        case .title(let sortOrder): return sortOrder
        }
    }
    
    public var value: String { self.enum.display }
    
    public var icon: IconEnum { self.order.icon }
        
}

private extension GameSortEnum {
    
    enum Enum: Enumerable {
        case release, title
        
        var display: String {
            switch self {
            case .release:
                return "Release Date"
            case .title:
                return "Title"
            }
        }
        
    }
    
    var `enum`: Enum {
        switch self {
        case .release:
            return .release
        case .title:
            return .title
        }
    }
    
    
}
