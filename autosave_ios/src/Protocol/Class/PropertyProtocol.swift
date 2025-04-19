//
//  PropertyProtocol.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/19/25.
//

import Foundation

public protocol PropertyProtocol {
    var type: PropertyEnum { get }
    var value_trim: String { get }
}

public extension PropertyProtocol {
    
    var snapshot: PropertySnapshot {
        switch self.type {
        case .format: return .format(.init(self.value_trim))
        case .physical: return .physical(.init(self.value_trim))
        case .digital: return .digital(.init(self.value_trim))
        case .system: return .system(.init(self.value_trim))
        case .nintendo: return .nintendo(.init(self.value_trim))
        case .playstation: return .playstation(.init(self.value_trim))
        case .os: return .os(.init(self.value_trim))
        case .xbox: return .xbox(.init(self.value_trim))
        case .mode: return .mode(.init(self.value_trim))
        case .series: return .series(.init(self.value_trim))
        case .developer: return .developer(.init(self.value_trim))
        case .publisher: return .publisher(.init(self.value_trim))
        case .genre: return .genre(.init(self.value_trim))
        }
    }
    
}
