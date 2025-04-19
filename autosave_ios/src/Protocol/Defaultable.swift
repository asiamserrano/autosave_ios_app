//
//  Defaultable.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/12/25.
//

import Foundation

public protocol Defaultable {
    static var defaultValue: Self { get }
}
