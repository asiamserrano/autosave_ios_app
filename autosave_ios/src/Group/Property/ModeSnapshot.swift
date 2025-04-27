//
//  ModeSnapshot.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/26/25.
//

import Foundation

public struct ModeSnapshot {
    let mode: ModeEnum
    
    public var snapshot: PropertySnapshot {
        let builder: ValueBuilder = .init(self.mode)
        return .init(.mode, builder)
    }
}
