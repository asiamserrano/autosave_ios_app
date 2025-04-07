//
//  Item.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/4/25.
//

import Foundation
import SwiftData

@Model
public final class Item {
    
    var timestamp: Date
    var obj: EncDecObj
    var str: Str
    
    init(timestamp: Date) {
        self.timestamp = timestamp
        self.obj = .random()
        self.str = .init(.random)
    }
    
}
