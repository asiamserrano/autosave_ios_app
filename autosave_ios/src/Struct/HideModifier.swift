//
//  HideModifier.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/10/25.
//

import Foundation
import SwiftUI

public struct HideModifier: ViewModifier {
    
    let isHidden: Bool
    
    init(_ hidden: Bool) {
        self.isHidden = hidden
    }
    
    public func body(content: Content) -> some View {
        content
            .opacity(self.isHidden ? 0 : 1)
            .disabled(self.isHidden)
    }
    
}
