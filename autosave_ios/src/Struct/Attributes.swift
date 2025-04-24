//
//  Attributes.swift
//  autosave_ios
//
//  Created by Asia Michelle Serrano on 4/23/25.
//

import Foundation
import SwiftUI

public enum AttributeEnum: Enumerable {
    case series
    case developer
    case publisher
    case genre
    case mode
    case platform
}

public enum AttributeBuilder: Comparable, Hashable {
    
    public static func < (lhs: Self, rhs: Self) -> Bool {
        if lhs.type == rhs.type {
            return lhs.value < rhs.value
        } else {
            return lhs.type < rhs.type
        }
    }
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
    
    case property(PropertySnapshot)
    case platform(PlatformSnapshot)
    
    var type: AttributeEnum {
        switch self {
        case .property(let p): return .init(p.type)
        case .platform(_): return .platform
        }
    }
    
    var value: ValueEnum {
        switch self {
        case .property(let p): return p.value
        case .platform(let p): return .platform(p)
        }
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.type)
        hasher.combine(self.value)
    }
    
}

//public class AttributesBuilder: ObservableObject {
//                
//    @Published var builders: Set<AttributeBuilder>
//    
//    public init(_ collection: any Collection<AttributeBuilder> = []) {
//        self.builders = .init(collection)
//    }
//    
//    public init(_ builder: AttributeBuilder) {
//        self.builders = [builder]
//    }
//
//}
//
//public struct AttributesSnapshot: Hashable {
//    
//    let builders: [AttributeBuilder]
//    
//    public init(_ builder: AttributesBuilder) {
//        self.builders = builder.builders.sorted()
//    }
//    
//}
