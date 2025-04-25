//
//  SystemProtocol.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/21/25.
//

import Foundation

public protocol SystemProtocol: PropertyProtocol {
    var systemEnum: SystemEnum { get }
    var physicalEnum: PhysicalEnum { get }
    var digitalEnums: [DigitalEnum] { get }
}

public extension SystemProtocol {
    
    var propertyEnum: PropertyEnum {
        .init(self.systemEnum)
    }
    
}
