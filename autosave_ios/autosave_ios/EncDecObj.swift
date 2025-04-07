//
//  EncDecObj.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/4/25.
//

import Foundation

public struct EncDecObj {
    
    private static let colors: [String] = ["red", "green", "blue", "yellow", "purple"]
    private static let numbers: [Int] = [1, 2, 3, 4, 5]
    
    public static func random() -> EncDecObj {
        let value: Int = Self.numbers.randomElement() ?? 0
        return .init(Self.colors.randomElement() ?? "", value.description)
    }
    
    let key: String
    let value: String
    
    public init() {
        self.key = ""
        self.value = ""
    }
    
    public init(_ key: String, _ value: String) {
        self.key = key
        self.value = value
    }
    
}

extension EncDecObj: Codable {
    
    private enum CodingKeys: String, CodingKey {
        case key
        case value
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.key, forKey: .key)
        try container.encode(self.value, forKey: .value)
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.key = try values.decode(String.self, forKey: .key)
        self.value = try values.decode(String.self, forKey: .value)
    }
    
}
