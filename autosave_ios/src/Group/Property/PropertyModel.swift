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
    
    public static func snapshot(_ snapshot: PropertySnapshot) -> PropertyModel {
        let model: PropertyModel = .init(snapshot.uuid)
        return model.update(snapshot)
    }
    
    public private(set) var uuid: UUID
    public private(set) var type_id: String
    public private(set) var value_canon: String
    public private(set) var value_trim: String
    
    private init(_ uuid: UUID) {
        self.uuid = uuid
        self.type_id = .defaultValue
        self.value_canon = .defaultValue
        self.value_trim = .defaultValue
    }
    
}

extension PropertyModel {
    
    @discardableResult
    public func update(_ snapshot: PropertySnapshot) -> PropertyModel {
        if self.uuid == snapshot.uuid {
            self.type_id = snapshot.type_id
            self.value_canon = snapshot.value_canon
            self.value_trim = snapshot.value_trim
        }
        return self
    }
    
}
