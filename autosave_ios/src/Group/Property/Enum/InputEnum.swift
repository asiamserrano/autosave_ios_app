//
//  InputEnum.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/26/25.
//

import Foundation

public enum InputEnum: Enumerable {
    case series
    case developer
    case publisher
    case genre
}

public enum SelectEnum {
    case format(FormatEnum)
    case physical(PhysicalEnum)
    case digital(DigitalEnum)
    case system(SystemEnum)
    case nintendo(NintendoEnum)
    case playstation(PlayStationEnum)
    case os(OSEnum)
    case xbox(XboxEnum)
    case mode(ModeEnum)
}
