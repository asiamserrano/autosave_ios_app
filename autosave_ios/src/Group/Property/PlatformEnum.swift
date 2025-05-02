//
//  PlatformEnum.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/25/25.
//

import Foundation

public enum PlatformEnum {
    
    case system(SystemBuilder)
    case format(FormatBuilder)
    
    public var key: PropertyBuilder {
        switch self {
        case .system(let system):
            switch system {
            case .playstation: return .system(.playstation)
            case .nintendo: return .system(.nintendo)
            case .xbox: return .system(.xbox)
            case .os: return .system(.os)
            }
        case .format(let format):
            switch format {
            case .digital: return .format(.digital)
            case .physical: return .format(.physical)
            }
        }
    }
    
    public var value: PropertyBuilder {
        switch self {
        case .system(let system):
            switch system {
            case .playstation(let p): return .playstation(p)
            case .nintendo(let n): return .nintendo(n)
            case .xbox(let x): return .xbox(x)
            case .os(let o): return .os(o)
            }
        case .format(let format):
            switch format {
            case .digital(let d): return .digital(d)
            case .physical(let p): return .physical(p)
            }
        }
    }
    
}
