//
//  FormatBuilder.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/21/25.
//

import Foundation

public enum FormatBuilder {
    case digital(DigitalEnum)
    case physical(PhysicalEnum)
}

extension FormatBuilder: Enumerable {
    
    public static var allCases: [Self] {
      FormatEnum.allCases.flatMap { category in
        switch category {
          case .digital:
            return DigitalEnum.cases.map(Self.digital)
          case .physical:
            return PhysicalEnum.cases.map(Self.physical)
        }
      }
    }
    
    public var id: String {
        switch self {
        case .digital(let e):  return e.id
        case .physical(let e): return e.id
        }
    }
    
    public var display: String {
        switch self {
        case .physical(let e): return e.display
        case .digital(let e):
            switch e {
            case .psn:      return "PlayStation Network"
            case .xbox:     return "Xbox Live"
            case .nintendo: return "Nintendo eShop"
            case .free:     return "DRM-free"
            case .origin:   return "Origin"
            case .steam:    return "Steam"
            }
        }
    }
    
}

public extension FormatBuilder {
    
    var formatEnum: FormatEnum {
        switch self {
        case .digital:  return .digital
        case .physical: return .physical
        }
    }
    
    var propertyEnum: PropertyEnum {
        self.formatEnum.propertyEnum
    }
    
//    var propertyEnum: PropertyEnum {
//        .init(self.formatEnum)
//    }
//    
//    var key: PropertySnapshot {
//        let builder: ValueBuilder = .init(self.propertyEnum)
//        return .init(.format, builder)
//    }
//    
//    var value: PropertySnapshot {
//        .init(self.propertyEnum, self.builder)
//    }
//    
//    var linkBuilder: LinkBuilder {
//        .property_pair(self.key, self.value)
//    }
//    
//    var linkSnapshot: LinkSnapshot {
//        .init(.format, self.linkBuilder)
//    }
    
}
