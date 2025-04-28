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

extension Array where Element == PropertySnapshot {
    
    public func getLinkSnapshots(_ game: GameSnapshot) -> [LinkSnapshot] {
        self.map {
            let builder: LinkBuilder = .game_property(game, $0)
            return .init(.property, builder)
        }
    }
    
}
