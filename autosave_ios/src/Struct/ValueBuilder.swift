//
//  ValueBuilder.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/19/25.
//

import Foundation

public struct ValueBuilder: Comparable, Hashable {
    
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
    
    public let canon: String
    public let trim: String
    
    public init(_ string: String) {
        self.canon = string.canonicalize()
        self.trim = string.trim()
    }
    
    public init(_ enumerable: any Enumerable) {
        self.canon = enumerable.id
        self.trim = enumerable.value
    }
    
    public init(_ enum1: any Enumerable, _ enum2: any Enumerable) {
        self.canon = enum1.id
        self.trim = enum2.id
    }
    
    private init(_ canon: String, _ trim: String) {
        self.canon = canon
        self.trim = trim
    }
    

    
////    case platform(PlatformSnapshot)
//    case valokey(Valokey)
//    case enumerable(any Enumerable)
//    case string(String)
//    
//    public var canon: String {
//        switch self {
//        case .platform(let snapshot): return snapshot.system.value
//        case .enumerable(let enumerable): return enumerable.id
//        case .string(let string): return string.canonicalize()
//        }
//    }
//    
//    public var trim: String {
//        switch self {
//        case .platform(let snapshot): return snapshot.format.value
//        case .enumerable(let enumerable): return enumerable.value
//        case .string(let string): return string.trim()
//        }
//    }
    
//    public func hash(into hasher: inout Hasher) {
//        hasher.combine(self.canon)
//        hasher.combine(self.trim)
//    }
    
}

// Maplet, Bindel, Pairxy
//public struct Valokey {
//    private let key: String
//    private let value: String
//}

//public enum EnumerableBuilder {
//    case format(FormatEnum)
//    case physical(PhysicalEnum)
//    case digital(DigitalEnum)
//    
//    private var object: any Enumerable {
//        switch self {
//        case .format(let formatEnum): return formatEnum
//        case .physical(let physicalEnum): return physicalEnum
//        case .digital(let digitalEnum): return digitalEnum
//        }
//    }
//}
