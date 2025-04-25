//
//  FormatProtocol.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/21/25.
//

import Foundation

public protocol FormatProtocol: PropertyProtocol {
    var formatEnum: FormatEnum { get }
}

public extension FormatProtocol {
    
    var propertyEnum: PropertyEnum {
        .init(self.formatEnum)
    }
    
}
