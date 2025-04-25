//
//  Image.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/11/25.
//

import Foundation
import SwiftUI

extension Image {
    
    public init(_ ui: UIImage) {
        if ui.isEmpty {
            self.init(.photo_circle_fill)
        } else {
            self.init(uiImage: ui)
        }
    }
    
    public init(_ icon: IconEnum) {
        self.init(systemName: icon.display)
    }
    
}
