//
//  Str.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/4/25.
//

import Foundation

public struct Str: Codable, Hashable {
    
    private let canon: String
    private let trim: String
    
    public init() {
        self.canon = ""
        self.trim = ""
    }
    
    public init(_ str: String) {
        self.canon = str.canonicalize()
        self.trim = str.trim()
    }
}

extension Str: Identifiable {
    
    public var id: String {
        self.canon
    }
    
    public var description: String {
        self.trim
    }
    
}
