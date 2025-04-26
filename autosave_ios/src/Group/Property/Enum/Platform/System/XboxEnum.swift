//
//  XboxEnum.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/20/25.
//

import Foundation

public enum XboxEnum: Enumerable {
    case xbox, x360, one
}

public extension XboxEnum {
    
    var end: String {
        switch self {
        case .xbox: return .defaultValue
        case .x360: return "360"
        case .one:  return "One"
        }
    }
    
}

//extension XboxEnum: Enumerable {
//    
//    public var display: String {
//        var end: String {
//            switch self {
//            case .xbox: return .defaultValue
//            case .x360: return "360"
//            case .one: return "One"
//            }
//        }
//        
//        return "\(self.systemEnum.display) \(end)".display
//    }
//    
//}
//
//extension XboxEnum: SystemProtocol {
//    
//    public var systemEnum: SystemEnum { .xbox }
//
//    public var physicalEnum: PhysicalEnum { .disc }
//    
//    public var digitalEnums: [DigitalEnum] {
//        switch self {
//        case .x360, .one: return [ .free, .xbox ]
//        default: return []
//        }
//    }
//    
//}
