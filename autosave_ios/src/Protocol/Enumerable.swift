//
//  EnumProtocol.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/10/25.
//

import Foundation

public protocol Enumerable: Identifiable, Hashable, Comparable, Equatable, CaseIterable, Iterable, Randomizable, Defaultable, Displayable { }

public extension Enumerable {
    
    static var random: Self {
        if let element: Self = Self.cases.randomElement() {
            return element
        } else {
            fatalError("unable to random element for \(Self.self)")
        }
    }
    
    static var defaultValue: Self {
        Self.cases.first!
    }
    
    static var cases: [Self] {
        Self.allCases.map { $0 }
    }
    
    var className: String { String(describing: Self.self) }
    
    static func cast(_ string: String) -> Self? {
        if let enumerable: Self = Self.cases.first(where: { $0.id == string || $0.display == string }) {
            return enumerable
        } else {
            return nil
        }
    }

    static func cast(_ other: any Enumerable) -> Self? {
        Self.cast(other.id)
    }
    
    static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.index < rhs.index
    }
    
    var id: String { String(describing: self) }
        
    var display: String { self.id.capitalized }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
        hasher.combine(self.display)
        hasher.combine(self.className)
    }
    
    init(_ other: any Enumerable) {
        if let found: Self = .cast(other) {
            self = found
        } else {
            fatalError("Unable to parse enumerable: \(other)")
        }
    }
    
    init(_ id: String) {
        if let found: Self = .cast(id) {
            self = found
        } else {
            fatalError("Unable to parse key: \(id)")
        }
    }
    
}

