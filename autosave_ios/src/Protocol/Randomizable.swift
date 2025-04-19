//
//  Randomizable.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/15/25.
//

import Foundation

public protocol Randomizable {
    static var random: Self { get }
}
