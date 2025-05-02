//
//  PlatformEnum.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/25/25.
//

import Foundation

public struct PlatformBuilder {
    let system: SystemBuilder
    let format: FormatBuilder
    
    public init(_ system: SystemBuilder, _ format: FormatBuilder) {
        self.system = system
        self.format = format
    }
    
}
