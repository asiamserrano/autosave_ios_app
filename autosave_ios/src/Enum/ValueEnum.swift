//
//  ValueBuilder.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/19/25.
//

import Foundation

public enum ValueEnum {
    
    case enumerable(any Enumerable)
    case string(String)
    
    public var canon: String {
        switch self {
        case .enumerable(let enumerable): return enumerable.id
        case .string(let string): return string.canonicalize()
        }
    }
    
    public var trim: String {
        switch self {
        case .enumerable(let enumerable): return enumerable.value
        case .string(let string): return string.trim()
        }
    }
    
//    init(_ type: PropertyEnum, _ value: String) {
//        switch type {
//        case .format: self = .enumerable(FormatEnum.init(value))
//        case .physical: self = .enumerable(PhysicalEnum.init(value))
//        case .digital: self = .enumerable(DigitalEnum.init(value))
//        case .system: self = .enumerable(SystemEnum.init(value))
//        case .nintendo: self = .enumerable(NintendoEnum.init(value))
//        case .playstation: self = .enumerable(PlayStationEnum.init(value))
//        case .os: self = .enumerable(OSEnum.init(value))
//        case .xbox: self = .enumerable(XboxEnum.init(value))
//        case .mode: self = .enumerable(ModeEnum.init(value))
//        case .series, .developer, .publisher, .genre:
//            self = .string(value)
//        }
//    }
    
}
