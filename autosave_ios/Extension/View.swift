//
//  View.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/10/25.
//

import Foundation
import SwiftUI

public extension View {
    
    var appScreenWidth: CGFloat { UIScreen.main.bounds.width }
    
    var TITLE_LABEL_STRING: String { "Title" }
    var RELEASE_DATE_LABEL_STRING: String { "Release Date" }
    var BACK_LABEL_STRING: String { "Back" }
    var CANCEL_LABEL_STRING: String { "Cancel" }
    var CONFIRM_LABEL_STRING: String { "Confirm" }
    var OK_LABEL_STRING: String { "OK" }
    var DONE_LABEL_STRING: String { "Done" }
    var DELETE_LABEL_STRING: String { "Delete" }
    var EDIT_LABEL_STRING: String { "Edit" }
    var ADD_LABEL_STRING: String { "Add" }
    var PROPERTY_LABEL_STRING: String { "Property" }
    var PROPERTIES_LABEL_STRING: String { "Properties" }
    var PLATFORM_LABEL_STRING: String { "Platform" }
    var GAMES_LABEL_STRING: String { "Games" }
    
    @ViewBuilder
    func FormattedView(_ key: String, _ value: String) -> some View {
        HStack {
            HStack {
                Text(key)
                    .foregroundColor(.gray)
                Spacer()
            }
            .frame(width: 95)
            Text(value)
                .multilineTextAlignment(.leading)
                .foregroundColor(.black)
        }
    }
    
    @ViewBuilder
    func FormattedView(_ key: String, _ values: [String]) -> some View {
        FormattedView(key, values.sorted().joined(separator: ",\n"))
    }
    
    @ViewBuilder
    func ConfirmButton(_ action: @escaping () -> Void ) -> some View {
        Button(CONFIRM_LABEL_STRING, role: .destructive) { action() }
    }
    
    @ViewBuilder
    func CancelButton(_ title: String) -> some View {
        Button(title, role: .cancel) { }
    }
    
    func hide(_ bool: Bool) -> some View {
        modifier(HideModifier(bool))
    }
    
    func show(_ bool: Bool) -> some View {
        modifier(HideModifier(!bool))
    }
    
    
}
