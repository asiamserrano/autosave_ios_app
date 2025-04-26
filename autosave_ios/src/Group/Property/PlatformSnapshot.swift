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
