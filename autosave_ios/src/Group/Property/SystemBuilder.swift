//
//  SystemBuilder.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/21/25.
//

import Foundation

public enum SystemBuilder {
    
    case playstation(PlayStationEnum)
    case nintendo(NintendoEnum)
    case xbox(XboxEnum)
    case os(OSEnum)
    
}

extension SystemBuilder: SystemProtocol {
    
    public static var allCases: [SystemBuilder] {
        var array: [Self] = .init()
        array.append(contentsOf: PlayStationEnum.cases.map(Self.playstation))
        array.append(contentsOf: NintendoEnum.cases.map(Self.nintendo))
        array.append(contentsOf: XboxEnum.cases.map(Self.xbox))
        array.append(contentsOf: OSEnum.cases.map(Self.os))
        return array
    }
    
    private var system: any SystemProtocol {
        switch self {
        case .playstation(let playstation): return playstation
        case .nintendo(let nintendo): return nintendo
        case .xbox(let xbox): return xbox
        case .os(let os): return os
        }
    }
    
    public var id: String {
        self.system.id
    }
    
    public var value: String {
        self.system.value
    }
    
    public var systemEnum: SystemEnum {
        self.system.systemEnum
    }
    
    public var physicalEnum: PhysicalEnum {
        self.system.physicalEnum
    }
    
    public var digitalEnums: [DigitalEnum] {
        self.system.digitalEnums
    }
    
    public var snapshot
    
}
