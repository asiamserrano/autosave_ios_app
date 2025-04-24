//
//  PropertyModel.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/19/25.
//

import Foundation
import SwiftData

@Model
public class PropertyModel {
    
    public private(set) var uuid: UUID
    public private(set) var type_id: String
    public private(set) var value_canon: String
    public private(set) var value_trim: String
    
    public init(_ snapshot: PropertySnapshot) {
        self.uuid = .init()
        self.type_id = snapshot.type.id
        self.value_canon = snapshot.value.canon
        self.value_trim = snapshot.value.trim
    }
    
}

extension PropertyModel: PropertyProtocol {
    
    public var type: PropertyEnum {
        .init(self.type_id)
    }
    
}
