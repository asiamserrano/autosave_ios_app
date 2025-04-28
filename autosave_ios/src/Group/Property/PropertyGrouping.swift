//
//  PropertyGrouping.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/26/25.
//

import Foundation

public enum PropertyGrouping {
    case single(PropertySnapshot)
    case double(PropertySnapshot, PropertySnapshot)
    case quadruple(PropertySnapshot, PropertySnapshot, PropertySnapshot, PropertySnapshot)
  
    /// Always returns a flat array of 1–4 elements
    public var snapshots: [PropertySnapshot] {
        switch self {
        case .single(let a): return .init(a)
        case .double(let a, let b): return .init(a, b)
        case .quadruple(let a, let b, let c, let d): return .init(a, b, c, d)
        }
    }
    
    public func combine(_ other: Self) -> Self {
        switch (self, other) {
        case let (.single(a), .single(b)): return .double(a, b)
        case let (.double(a, b), .double(c, d)): return .quadruple(a, b, c, d)
        default: return self
        }
    }
    
}
