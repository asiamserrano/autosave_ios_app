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
    
    public static func platform(_ snapshot: PlatformSnapshot) -> Self {
        let system: Self = .platform(.system, snapshot)
        let format: Self = .platform(.format, snapshot)
        return system.combine(format)
    }
    
    public static func platform(_ platformEnum: PlatformEnum, _ snapshot: PlatformSnapshot) -> Self {
        let propertyEnum: PropertyEnum = .init(platformEnum)
        let builder: PlatformBuilder = snapshot.getBuilder(platformEnum)
        switch builder {
        case .system(let system):
            let value: ValueBuilder = .init(system.systemEnum)
            let a: PropertySnapshot = .init(.system, value)
            let b: PropertySnapshot = .init(propertyEnum, system.builder)
            return .double(a, b)
        case .format(let format):
            let value: ValueBuilder = .init(format.formatEnum)
            let a: PropertySnapshot = .init(.format, value)
            let b: PropertySnapshot = .init(propertyEnum, format.builder)
            return .double(a, b)
        }
    }
  
//    public static func system(_ snapshot: PlatformSnapshot) -> Self {
//        let propertyEnum: PropertyEnum = .init(snapshot.system.platformEnum)
//        let builder: ValueBuilder = .init(self.propertyEnum)
//        let a: PropertySnapshot = .init(propertyEnum, <#T##value: ValueBuilder##ValueBuilder#>)
//        let b: PropertySnapshot = snapshot.system.value
//        return .double(a, b)
//    }
//
//    public static func format(_ snapshot: PlatformSnapshot) -> Self {
//        let a: PropertySnapshot = snapshot.format.key
//        let b: PropertySnapshot = snapshot.format.value
//        return .double(a, b)
//    }
    
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
