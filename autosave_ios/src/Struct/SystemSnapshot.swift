//
//  SystemSnapshot.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/21/25.
//

import Foundation

public struct SystemSnapshot {
    
    private let system: any SystemProtocol
        
    public init(_ system: any SystemProtocol) {
        self.system = system
    }
    
    var key: String {
        self.system.systemEnum.id
    }
    
    var value: String {
        self.system.id
    }
    
    var builder: SystemBuilder {
        .init(self.system)
    }
    
}
