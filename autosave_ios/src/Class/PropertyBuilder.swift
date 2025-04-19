//
//  PropertyBuilder.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/19/25.
//

import Foundation

public class PropertyBuilder: ObservableObject {
    
    public let type: PropertyEnum
    @Published var value: String
    
    public init(_ type: PropertyEnum) {
        self.type = type
        self.value = .defaultValue
    }
    
    public init(_ snapshot: PropertySnapshot) {
        self.type = snapshot.type
        self.value = snapshot.value.trim
    }
    
    public convenience init(_ model: PropertyModel) {
        let snapshot: PropertySnapshot = model.snapshot
        self.init(snapshot)
    }
    
}

extension PropertyBuilder: PropertyProtocol {
    
    public var value_trim: String {
        self.value.trim()
    }
    
}

public enum FormatEnum: Enumerable { case one }
public enum DigitalEnum: Enumerable { case one }
public enum PhysicalEnum: Enumerable { case one }
public enum SystemEnum: Enumerable { case one }
public enum NintendoEnum: Enumerable { case one }
public enum OSEnum: Enumerable { case one }
public enum PlayStationEnum: Enumerable { case one }
public enum XboxEnum: Enumerable { case one }
public enum ModeEnum: Enumerable { case one }
