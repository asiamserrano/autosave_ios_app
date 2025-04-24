//
//  ValueBuilder.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/19/25.
//

import Foundation

public enum ValueEnum: Comparable, Hashable {
    
    public static func < (lhs: Self, rhs: Self) -> Bool {
        if lhs.canon == rhs.canon {
            return lhs.trim < rhs.trim
        } else {
            return lhs.canon < rhs.canon
        }
    }
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
    
    case platform(PlatformSnapshot)
    case enumerable(any Enumerable)
    case string(String)
    
    public var canon: String {
        switch self {
        case .platform(let snapshot): return snapshot.system.value
        case .enumerable(let enumerable): return enumerable.id
        case .string(let string): return string.canonicalize()
        }
    }
    
    public var trim: String {
        switch self {
        case .platform(let snapshot): return snapshot.format.value
        case .enumerable(let enumerable): return enumerable.value
        case .string(let string): return string.trim()
        }
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.canon)
        hasher.combine(self.trim)
    }
    
}
