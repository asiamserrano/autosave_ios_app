//
//  FormatSnapshot.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/21/25.
//

import Foundation

public struct FormatSnapshot {
    
    private let format: any FormatProtocol
        
    init(_ format: any FormatProtocol) {
        self.format = format
    }
    
    var key: String {
        self.format.formatEnum.id
    }
    
    var value: String {
        self.format.id
    }
    
    var builder: FormatBuilder {
        .init(self.format)
    }
    
}
