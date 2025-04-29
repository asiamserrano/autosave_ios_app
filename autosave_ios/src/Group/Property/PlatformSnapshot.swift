//////
//////  PlatformSnapshot.swift
//////  autosave_ios
//////
//////  Created by Asia Serrano on 4/21/25.
////
//
//import Foundation
//
//public struct PlatformSnapshot {
//    
//    private struct Foobar {
//        let type: PropertyEnum
//        let key: PropertySnapshot
//        let value: PropertySnapshot
//        
//        init(_ system: SystemBuilder) {
//            let propertyEnum: PropertyEnum = system.propertyEnum
//            self.type = .system
//            self.key = .init(.system, .init(propertyEnum), "")
//            self.value = .init(propertyEnum, system.builder, "")
//        }
//        
//        init(_ format: FormatBuilder) {
//            let propertyEnum: PropertyEnum = format.propertyEnum
//            self.type = .format
//            self.key = .init(.format, .init(propertyEnum), "")
//            self.value = .init(propertyEnum, format.builder, "")
//        }
//        
//    }
//    
////    public let system: PlatformBuilder
////    public let format: PlatformBuilder
//    
//    private let system: Foobar
//    private let format: Foobar
////    private let snapshot: LinkSnapshot
//    
//    public init(_ system: SystemBuilder, _ format: FormatBuilder) {
//        self.system = .init(system)
//        self.format = .init(format)
////        self.system = .system(system)
////        self.format = .format(format)
//    }
//    
////    public func getPlatformBuilder(_ type: PlatformEnum) -> PlatformBuilder {
////        switch type {
////        case .system: return self.system
////        case .format: return self.format
////        }
////    }
////    
////    public func getLinkSnapshot(_ platformEnum: PlatformEnum? = nil) -> LinkSnapshot {
////        if let platformEnum: PlatformEnum = platformEnum {
////            let propertyEnum: PropertyEnum = .init(platformEnum)
////            let builder: PlatformBuilder = self.getPlatformBuilder(platformEnum)
////            switch builder {
////            case .system(let system):
////                let value: ValueBuilder = .init(system.systemEnum)
////                let a: PropertySnapshot = .init(.system, value)
////                let b: PropertySnapshot = .init(propertyEnum, system.builder)
////                let builder: LinkBuilder = .property_pair(a, b)
////                return .init(.system, builder)
////            case .format(let format):
////                let value: ValueBuilder = .init(format.formatEnum)
////                let a: PropertySnapshot = .init(.format, value)
////                let b: PropertySnapshot = .init(propertyEnum, format.builder)
////                let builder: LinkBuilder = .property_pair(a, b)
////                return .init(.format, builder)
////            }
////        } else {
////            let a: LinkSnapshot = self.getLinkSnapshot(.system)
////            let b: LinkSnapshot = self.getLinkSnapshot(.format)
////            let builder: LinkBuilder = .link_pair(a, b)
////            return .init(.link, builder)
////        }
////    }
////    
////    public func getLinkSnapshot(_ game: GameSnapshot) -> LinkSnapshot {
////        let snapshot: LinkSnapshot = self.getLinkSnapshot()
////        let builder: LinkBuilder = .game_platform(game, snapshot)
////        return .init(.platform, builder)
////    }
//    
////    public func getLinkBuilder(_ platformEnum: PlatformEnum? = nil) -> LinkBuilder {
////        if let platformEnum: PlatformEnum = platformEnum {
////            let propertyEnum: PropertyEnum = .init(platformEnum)
////            let builder: PlatformBuilder = self.getPlatformBuilder(platformEnum)
////            switch builder {
////            case .system(let system):
////                let value: ValueBuilder = .init(system.systemEnum)
////                let a: PropertySnapshot = .init(.system, value)
////                let b: PropertySnapshot = .init(propertyEnum, system.builder)
////                return .property_pair(a, b)
////            case .format(let format):
////                let value: ValueBuilder = .init(format.formatEnum)
////                let a: PropertySnapshot = .init(.format, value)
////                let b: PropertySnapshot = .init(propertyEnum, format.builder)
////                return .property_pair(a, b)
////            }
////        } else {
////            let a: LinkSnapshot = self.getLinkSnapshot(.system)
////            let b: LinkSnapshot = self.getLinkSnapshot(.format)
////            return .link_pair(a, b)
////        }
////    }
////    
////    public func getLinkBuilder(_ game: GameSnapshot) -> LinkBuilder {
////        let builder: LinkBuilder = self.getLinkBuilder()
////        let snapshot: LinkSnapshot = .init(.platform, builder)
////        return .game_platform(game, snapshot)
////    }
//    
////    public func getLinkSnapshot(_ platformEnum: PlatformEnum) -> LinkSnapshot {
////        let builder: LinkBuilder = self.getLinkBuilder(platformEnum)
////        let linkEnum: LinkEnum = .init(platformEnum)
////        return .init(linkEnum, builder)
////    }
//    
////    public func get(_ snapshot: PlatformSnapshot) -> PropertyGrouping {
////        let system: PropertyGrouping = .platform(.system, snapshot)
////        let format: PropertyGrouping = .platform(.format, snapshot)
////        return system.combine(format)
////    }
//    
////    public func getPropertyGrouping(_ platformEnum: PlatformEnum? = nil) -> PropertyGrouping {
////        if let platformEnum: PlatformEnum = platformEnum {
////            let propertyEnum: PropertyEnum = .init(platformEnum)
////            let builder: PlatformBuilder = self.getPlatformBuilder(platformEnum)
////            switch builder {
////            case .system(let system):
////                let value: ValueBuilder = .init(system.systemEnum)
////                let a: PropertySnapshot = .init(.system, value)
////                let b: PropertySnapshot = .init(propertyEnum, system.builder)
////                return .double(a, b)
////            case .format(let format):
////                let value: ValueBuilder = .init(format.formatEnum)
////                let a: PropertySnapshot = .init(.format, value)
////                let b: PropertySnapshot = .init(propertyEnum, format.builder)
////                return .double(a, b)
////            }
////        } else {
////            let system: PropertyGrouping = self.getPropertyGrouping(.system)
////            let format: PropertyGrouping = self.getPropertyGrouping(.format)
////            return system.combine(format)
////        }
////    }
//    
////    public var linkBuilder: LinkBuilder {
////        let a: LinkSnapshot = self.getLinkSnapshot(.system)
////        let b: LinkSnapshot = self.getLinkSnapshot(.format)
////        return .link_pair(a, b)
////    }
//    
//    
//    
////    public var linkBuilder: LinkBuilder {
////        .link_pair(self.system.linkSnapshot, self.format.linkSnapshot)
////    }
////    
////    public var linkSnapshot: LinkSnapshot {
////        .init(.link, self.linkBuilder)
////    }
//    
//}
//
//extension PlatformSnapshot: Randomizable {
//    
//    public static var random: Self {
//        .init(.random, .random)
//    }
//    
//}
//
//extension PlatformSnapshot: Defaultable {
//    
//    public static var defaultValue: PlatformSnapshot {
//        .init(.defaultValue, .defaultValue)
//    }
//    
//}
