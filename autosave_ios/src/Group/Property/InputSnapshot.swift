////
////  InputSnapshot.swift
////  autosave_ios
////
////  Created by Asia Serrano on 4/26/25.
////
//
//import Foundation
//
//public struct InputSnapshot {
//    
//    let input: InputEnum
//    let string: String
//    
//    public init(_ input: InputEnum, _ string: String) {
//        self.input = input
//        self.string = string
//    }
//    
//    public var snapshot: PropertySnapshot {
//        let type: PropertyEnum = .init(self.input)
//        let builder: ValueBuilder = .init(self.string)
//        return .init(type, builder, .defaultValue)
//    }
//    
//    public var grouping: PropertyGrouping {
//        .single(self.snapshot)
//    }
//    
//}
