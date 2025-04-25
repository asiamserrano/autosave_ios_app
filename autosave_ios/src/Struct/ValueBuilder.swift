//
//  ValueBuilder.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/19/25.
//

import Foundation

public protocol ValueProtocol: Identifiable, Hashable {
    var id: String { get }
    var display: String { get }
}

public typealias StringValue = ValueBuilder<String>
public typealias EnumerableValue<E: Enumerable> = ValueBuilder<E>

public struct ValueBuilder<T: ValueProtocol> {
    
    let source: T
    
    init(_ src: T) {
        self.source = src
    }
}

extension ValueBuilder: ValueProtocol {
    public var id: String { source.id }
    public var display:  String { source.display  }
}

//public struct ValueBuilder {
//    
//    public static var defaultValue: Self {
//        let builder: PropertyBuilder = .series(.defaultValue)
//        return .build(builder)
////        return builder.value
////        .init(.defaultValue)
//    }
//    
//    public static var random: Self {
//        let builder: PropertyBuilder = .random(.random)
//        return .build(builder)
//    }
//    
//    private static func build(_ builder: PropertyBuilder) -> Self {
//        switch builder {
//        case .format(let formatEnum): return .init(formatEnum)
//        case .physical(let physicalEnum): return .init(physicalEnum)
//        case .digital(let digitalEnum): return .init(digitalEnum)
//        case .system(let systemEnum): return .init(systemEnum)
//        case .nintendo(let nintendoEnum): return .init(nintendoEnum)
//        case .playstation(let playStationEnum): return .init(playStationEnum)
//        case .os(let oSEnum): return .init(oSEnum)
//        case .xbox(let xboxEnum): return .init(xboxEnum)
//        case .mode(let modeEnum): return .init(modeEnum)
//        case .series(let string): return .init(string)
//        case .developer(let string): return .init(string)
//        case .publisher(let string): return .init(string)
//        case .genre(let string): return .init(string)
//        }
//    }
//    
////    public static func defaultValue(_ type: PropertyEnum) -> Self {
////        let builder: PropertyBuilder = .series(.defaultValue)
////        return builder.value
////    }
////    
////    public static func random(_ type: PropertyEnum) -> Self {
////        .init(.random)
////    }
//    
//    public let canon: String
//    public let trim: String
//    
////    public init(_ property: PropertyEnum, _ str: String) {
////        self.can
////    }
//    
//    public init(_ string: String) {
//        self.canon = string.canonicalize()
//        self.trim = string.trim()
//    }
//
//    public init(_ enumerable: any Enumerable) {
//        self.canon = enumerable.id
//        self.trim = enumerable.value
//    }
////    
////    public init(_ enum1: any Enumerable, _ enum2: any Enumerable) {
////        self.canon = enum1.id
////        self.trim = enum2.id
////    }
//    
//    private init(_ canon: String, _ trim: String) {
//        self.canon = canon
//        self.trim = trim
//    }
//    
//}
//
//extension ValueBuilder: Comparable {
//    
//    public static func < (lhs: Self, rhs: Self) -> Bool {
//        if lhs.canon == rhs.canon {
//            return lhs.trim < rhs.trim
//        } else {
//            return lhs.canon < rhs.canon
//        }
//    }
//    
//}
//
//extension ValueBuilder: Hashable {
//    
//    public static func == (lhs: Self, rhs: Self) -> Bool {
//        lhs.hashValue == rhs.hashValue
//    }
//    
//}

    
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
