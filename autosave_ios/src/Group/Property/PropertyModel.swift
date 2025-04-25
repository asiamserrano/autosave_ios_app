//
//  PropertyModel.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/19/25.
//

import Foundation
import SwiftData


/*
 
 Model class for a property
 
 */

@Model
public class PropertyModel {
    
    public static func build() -> PropertyModel {
        .init()
    }
    
    public private(set) var uuid: UUID
    public private(set) var type_id: String
    public private(set) var value_canon: String
    public private(set) var value_trim: String
    
    private init() {
        self.uuid = .init()
        self.type_id = .defaultValue
        self.value_canon = .defaultValue
        self.value_trim = .defaultValue
    }
    
}
