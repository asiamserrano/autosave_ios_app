//
//  PlatformEnum.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/25/25.
//

import Foundation

public enum PlatformBuilder {
    case system(SystemBuilder)
    case format(FormatBuilder)
}

extension PlatformBuilder: Enumerable {

    public static var allCases: [Self] {
      PlatformEnum.allCases.flatMap { category in
        switch category {
          case .system:
            return SystemBuilder.cases.map(Self.system)
          case .format:
            return FormatBuilder.cases.map(Self.format)
        }
      }
    }
    
}

extension PlatformBuilder {
    
    private var property: PropertyEnum {
        switch self {
        case .system(let systemBuilder): return .init(systemBuilder.systemEnum)
        case .format(let formatBuilder): return .init(formatBuilder.formatEnum)
        }
    }
    
    public var key: PropertySnapshot {
        let value: ValueBuilder = .init(self.property)
        switch self {
        case .system: return .init(.system, value)
        case .format: return .init(.format, value)
        }
    }
    
    public var value: PropertySnapshot {
        switch self {
        case .system(let systemBuilder): return .init(self.property, systemBuilder.builder)
        case .format(let formatBuilder): return .init(self.property, formatBuilder.builder)
        }
    }
    
}
