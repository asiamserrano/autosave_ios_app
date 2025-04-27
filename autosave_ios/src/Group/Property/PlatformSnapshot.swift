////
////  PlatformSnapshot.swift
////  autosave_ios
////
////  Created by Asia Serrano on 4/21/25.
//

import Foundation

public struct PlatformSnapshot {
    
    public let system: PlatformBuilder
    public let format: PlatformBuilder
    
    public init(_ system: SystemBuilder, _ format: FormatBuilder) {
        self.system = .system(system)
        self.format = .format(format)
    }
    
    public func getBuilder(_ type: PlatformEnum) -> PlatformBuilder {
        switch type {
        case .system: return self.system
        case .format: return self.format
        }
    }
    
//    public var linkBuilder: LinkBuilder {
//        .link_pair(self.system.linkSnapshot, self.format.linkSnapshot)
//    }
//    
//    public var linkSnapshot: LinkSnapshot {
//        .init(.link, self.linkBuilder)
//    }
    
}

extension PlatformSnapshot: Randomizable {
    
    public static var random: Self {
        .init(.random, .random)
    }
    
}

extension PlatformSnapshot: Defaultable {
    
    public static var defaultValue: PlatformSnapshot {
        .init(.defaultValue, .defaultValue)
    }
    
}
