//
//  JunctionModel.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/20/25.
//

import Foundation
import SwiftData

@Model
public class LinkModel {
    
    public private(set) var uuid: UUID
    public private(set) var key_uuid: UUID
    public private(set) var value_uuid: UUID
    public private(set) var type_id: String
    
    public init(_ snapshot: LinkSnapshot) {
        self.uuid = .init()
        self.key_uuid = snapshot.key_uuid
        self.value_uuid = snapshot.value_uuid
        self.type_id = snapshot.type_id
    }
    
}

// ── The 5 link-types you need ────────────────────────────────────────────
public enum LinkEnum: Enumerable {
    case system     // systemKeyProp → systemValueProp
    case format     // formatKeyProp → formatValueProp
    case link       // systemValueLink → formatValueLink
    case property   // game → property
    case platform   // game → sysformLink
}

public enum LinkBuilder: Displayable {
    
//    public static func platform(_ snapshot: PlatformSnapshot) -> Self {
//        let system: LinkSnapshot = snapshot.system.snapshot
//        let format: LinkSnapshot = snapshot.format.snapshot
//        return .link_pair(system, format)
//    }
    
    case property_pair(PropertySnapshot, PropertySnapshot)
    case link_pair(LinkSnapshot, LinkSnapshot)
    case game_property(GameSnapshot, PropertySnapshot)
    case game_platform(GameSnapshot, LinkSnapshot)

    private var key: UUID {
        switch self {
        case .property_pair(let p, _): return p.uuid
        case .link_pair(let l, _): return l.uuid
        case .game_property(let g, _):return g.uuid
        case .game_platform(let g, _): return g.uuid
        }
    }
    
    private var value: UUID {
        switch self {
        case .property_pair(_, let p): return p.uuid
        case .link_pair(_, let l): return l.uuid
        case .game_property(_, let p):return p.uuid
        case .game_platform(_, let l): return l.uuid
        }
    }
    
    public var id: String {
        self.key.uuidString
    }
    
    public var display: String {
        self.value.uuidString
    }

}


// TODO: finish this logic

public enum LinkGrouping {
    
    public static func platform(_ snapshot: PlatformSnapshot) -> Self {
        .none
    }
    
//    public static func platform(_ platformEnum: PlatformEnum, _ snapshot: PlatformSnapshot) -> Self {
//        let propertyEnum: PropertyEnum = .init(platformEnum)
//        let builder: PlatformBuilder = snapshot.getBuilder(platformEnum)
//        switch builder {
//        case .system(let system):
//            let value: ValueBuilder = .init(system.systemEnum)
//            let a: PropertySnapshot = .init(.system, value)
//            let b: PropertySnapshot = .init(propertyEnum, system.builder)
//            let snap: LinkSnapshot = .init(.system,)
//            return .single(<#T##LinkSnapshot#>)(a, b)
//        case .format(let format):
//            let value: ValueBuilder = .init(format.formatEnum)
//            let a: PropertySnapshot = .init(.format, value)
//            let b: PropertySnapshot = .init(propertyEnum, format.builder)
//            return .double(a, b)
//        }
//    }
    
    case none
    case single(LinkSnapshot)
    case double(LinkSnapshot, LinkSnapshot)
    
    /// Always returns a flat array of 1–4 elements
    public var snapshots: [LinkSnapshot] {
        switch self {
        case .none: return .init()
        case .single(let a): return .init(a)
        case .double(let a, let b): return .init(a, b)
        }
    }
    
}

// ── Pure data struct, no recursion ──────────────────────────────────────
public struct LinkSnapshot {
    
//    public static func system(_ builder: SystemBuilder) -> Self {
//        let builder: LinkBuilder = .property_pair(builder.key, builder.value)
//        return .init(.system, builder)
//    }
//    
//    public static func format(_ builder: FormatBuilder) -> Self {
//        let builder: LinkBuilder = .property_pair(builder.key, builder.value)
//        return .init(.format, builder)
//    }
    
    public let uuid: UUID
    public let type: LinkEnum
    public let value: ValueBuilder
    
    public init(_ type: LinkEnum, _ link: LinkBuilder) {
        self.uuid = .init()
        self.type = type
        self.value = link.builder
    }
    
    public var key_uuid: UUID {
        .init(uuidString: value.id) ?? .init()
    }
    
    public var value_uuid: UUID {
        .init(uuidString: value.display) ?? .init()
    }
    
    public var type_id: String {
        self.type.id
    }
    
}
