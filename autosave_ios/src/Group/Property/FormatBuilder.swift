//
//  FormatBuilder.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/21/25.
//

import Foundation

public enum FormatBuilder {
    
    case digital(DigitalEnum)
    case physical(PhysicalEnum)
    
}

extension FormatBuilder: FormatProtocol {
    
    public static var allCases: [FormatBuilder] {
        var array: [Self] = .init()
        array.append(contentsOf: DigitalEnum.cases.map(Self.digital))
        array.append(contentsOf: PhysicalEnum.cases.map(Self.physical))
        return array
    }
    
    private var format: any FormatProtocol {
        switch self {
        case .digital(let digitalEnum): return digitalEnum
        case .physical(let physicalEnum): return physicalEnum
        }
    }
    
    public var id: String {
        self.format.id
    }
    
    public var formatEnum: FormatEnum {
        self.format.formatEnum
    }
    
}


