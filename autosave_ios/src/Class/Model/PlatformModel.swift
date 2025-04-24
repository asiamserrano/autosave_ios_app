//
//  PlatformModel.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/21/25.
//

import Foundation
import SwiftData

@Model
public class PlatformModel {
    
    public private(set) var system_key: String
    public private(set) var system_value: String
    public private(set) var format_key: String
    public private(set) var format_value: String
    
    public init(_ snapshot: PlatformSnapshot) {
        self.system_key = snapshot.system.key
        self.system_value = snapshot.system.value
        self.format_key = snapshot.format.key
        self.format_value = snapshot.format.value
    }
    
}
