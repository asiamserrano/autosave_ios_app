//
//  ConstantsEnum.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/18/25.
//

import Foundation

public enum ConstantsEnum: Enumerable {
    
    case title
    case release_date
    case back
    case cancel
    case confirm
    case ok
    case done
    case delete
    case edit
    case add
    case property
    case properties
    case platform
    case games
    
}

extension ConstantsEnum {
    
    public var display: String {
        id.replacingOccurrences(of: "_", with: " ").capitalized
    }
    
}
