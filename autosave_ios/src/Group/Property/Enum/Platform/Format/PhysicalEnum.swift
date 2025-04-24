//
//  PhysicalEnum.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/20/25.
//

import Foundation

public enum PhysicalEnum: Enumerable {
    case disc, cartridge, card
}

extension PhysicalEnum: FormatProtocol {
    
    public var formatEnum: FormatEnum { .physical }
    
}
