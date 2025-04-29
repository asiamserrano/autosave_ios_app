////
////  PlatformEnum.swift
////  autosave_ios
////
////  Created by Asia Serrano on 4/25/25.
////
//
//import Foundation
//
//public enum PlatformBuilder {
//    case system(SystemBuilder)
//    case format(FormatBuilder)
//}
//
//extension PlatformBuilder: Enumerable {
//
//    public static var allCases: [Self] {
//      PlatformEnum.allCases.flatMap { category in
//        switch category {
//          case .system:
//            return SystemBuilder.cases.map(Self.system)
//          case .format:
//            return FormatBuilder.cases.map(Self.format)
//        }
//      }
//    }
//    
//}
//
//extension PlatformBuilder {
//    
//    public var platformEnum: PlatformEnum {
//        switch self {
//        case .system: return .system
//        case .format: return .format
//        }
//    }
//    
////    public var linkEnum: LinkEnum {
////        .init(self.platformEnum)
////    }
////    
////    public var key: PropertySnapshot {
////        switch self {
////        case .system(let s): return s.key
////        case .format(let f): return f.key
////        }
////    }
////    
////    public var value: PropertySnapshot {
////        switch self {
////        case .system(let s): return s.value
////        case .format(let f): return f.value
////        }
////    }
////    
////    public var linkSnapshot: LinkSnapshot {
////        switch self {
////        case .system(let s): return s.linkSnapshot
////        case .format(let f): return f.linkSnapshot
////        }
////    }
//    
//}
