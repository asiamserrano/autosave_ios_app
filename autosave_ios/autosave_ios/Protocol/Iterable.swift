//
//  Iterable.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/12/25.
//

import Foundation

public protocol Iterable {
    static var cases: [Self] { get }
}

extension Iterable where Self: Equatable {
    
    var index: Int {
        Self.cases.firstIndex(of: self) ?? -1
    }

    var next: Self {
        let value: Int = index + 1
        let next: Int = value == Self.cases.count ? 0 : value
        return Self.cases[next]
    }
    
}
