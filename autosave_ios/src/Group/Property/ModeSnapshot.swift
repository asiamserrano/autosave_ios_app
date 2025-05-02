////
////  ModeSnapshot.swift
////  autosave_ios
////
////  Created by Asia Serrano on 4/26/25.
////
//
//import Foundation
//
//public struct ModeSnapshot {
//    let mode: ModeEnum
//    
//    public init(_ mode: ModeEnum) {
//        self.mode = mode
//    }
//    
//    public var snapshot: PropertySnapshot {
//        let display: Display = .init(self.mode)
//        return .init(.mode, display, .defaultValue)
//    }
//    
//    public var grouping: PropertyGrouping {
//        .single(self.snapshot)
//    }
//    
//}
