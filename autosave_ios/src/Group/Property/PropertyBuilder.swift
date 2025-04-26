////
////  PropertyBuilder.swift
////  autosave_ios
////
////  Created by Asia Serrano on 4/19/25.
//

import Foundation

public enum PropertyBuilder {
    case series(String)
    case developer(String)
    case publisher(String)
    case genre(String)
    case platform(PlatformSnapshot)
    case mode(ModeEnum)
}

extension Array where Element == PropertySnapshot {
    
    public init(_ type: PropertyEnum, _ value: ValueBuilder) {
        let snapshot: PropertySnapshot = .init(type, value)
        self.init(snapshot)
    }
    
}


// TODO: move this

extension Array where Element == PropertyBuilder {
    
    public var snapshots: [PropertySnapshot] {
        self.flatMap { builder -> [PropertySnapshot] in
            switch builder {
            case .series(let string): return .init(.series, string.builder)
            case .developer(let string): return .init(.developer, string.builder)
            case .publisher(let string): return .init(.publisher, string.builder)
            case .genre(let string): return .init(.genre, string.builder)
            case .mode(let modeEnum): return .init(.mode, modeEnum.builder)
            case .platform(let platformSnapshot):
                return [
                    platformSnapshot.system.key,
                    platformSnapshot.system.value,
                    platformSnapshot.format.key,
                    platformSnapshot.format.value
                ]
            }
        }
    }
    
}

extension Array where Element == PropertySnapshot {
  /// Reconstruct PropertyBuilder cases from a flat list of snapshots.
  public func toBuilders() -> [PropertyBuilder] {
    // 1) Group snapshots by their PropertyEnum
    let byType = Dictionary(grouping: self, by: \.type)

    var result: [PropertyBuilder] = []

    // 2) Handle singleton‐value cases
    for type in [ .series, .developer, .publisher, .genre ] as [PropertyEnum] {
      guard let snap = byType[type]?.first else { continue }
      let text = snap.value_trim
      switch type {
      case .series:    result.append(.series(text))
      case .developer: result.append(.developer(text))
      case .publisher: result.append(.publisher(text))
      case .genre:     result.append(.genre(text))
      default: break
      }
    }

    // mode (enum) case
    if let modeSnap = byType[.mode]?.first {
      let enumValue = ModeEnum(modeSnap.value_canon)
      result.append(.mode(enumValue))
    }

    // 3) Rebuild the single .platform from its four snapshots
    if
      let sysSnaps = byType[.system], sysSnaps.count == 2,
      let fmtSnaps = byType[.format], fmtSnaps.count == 2
    {
      // the second snapshot in each pair holds the actual Enum value
      let sysEnum  = SystemEnum(sysSnaps[1].value_canon)
      let fmtEnum  = FormatEnum(fmtSnaps[1].value_canon)
      let sb       = SystemBuilder(sysEnum)
      let fb       = FormatBuilder(fmtEnum)
      result.append(.platform(PlatformSnapshot(sb, fb)))
    }

    return result
  }
}
