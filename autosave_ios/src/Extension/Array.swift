//
//  Array.swift
//  autosave_ios
//
//  Created by Asia Michelle Serrano on 4/10/25.
//

import Foundation

extension Array {
    
    public static var defaultValue: Self { .init() }
    
    public init(_ elements: Element...) {
        self.init(elements)
    }
    
    public var random: Element {
        if let element: Element = self.randomElement() {
            return element
        } else {
            fatalError("array is empty. cannot get random element")
        }
    }
    
}

extension Array where Element == PropertyBuilder {
    
    public var snapshots: [PropertySnapshot] {
        self.map(\.grouping).flatMap(\.snapshots)
    }
    
}

//extension Array where Element == PropertySnapshot {
//    
//    
//    
//}

//extension Array where Element == PropertyBuilder {
//    
//    public var snapshots: [PropertySnapshot] {
//        self.flatMap { builder -> [PropertySnapshot] in
//            switch builder {
////            case .series(let string): return .init(.series, string.builder)
////            case .developer(let string): return .init(.developer, string.builder)
////            case .publisher(let string): return .init(.publisher, string.builder)
////            case .genre(let string): return .init(.genre, string.builder)
//            case .input(let i): return .init(i.type, i.builder)
//            case .mode(let modeEnum): return .init(.mode, modeEnum.builder)
//            case .platform(let platformSnapshot):
//                return [
//                    platformSnapshot.system.key,
//                    platformSnapshot.system.value,
//                    platformSnapshot.format.key,
//                    platformSnapshot.format.value
//                ]
//            }
//        }
//    }
//    
//}
