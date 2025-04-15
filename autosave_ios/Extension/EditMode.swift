//
//  EditMode.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/12/25.
//

import Foundation
import SwiftUI

extension EditMode: Defaultable, Iterable {
    
    public static var defaultValue: Self { .active }
    
    public static var cases: [Self] { [.active, .inactive] }
    
}
