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
    
    @ViewBuilder
    func FormattedView(_ constants: ConstantsEnum, _ value: String) -> some View {
        FormattedView(value, {
            ConstantsText(constants)
        })
    }
    
    @ViewBuilder
    func FormattedView(_ key: String, _ value: String) -> some View {
        FormattedView(value, {
            Text(key)
        })
    }
    
    @ViewBuilder
    func FormattedView(_ value: String, @ViewBuilder _ key: () -> some View) -> some View {
        HStack {
            HStack {
                key()
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
    func FormattedView(_ constants: ConstantsEnum, _ values: [String]) -> some View {
        FormattedView(constants, values.sorted().joined(separator: ",\n"))
    }
    
    @ViewBuilder
    func ConfirmButton(_ action: @escaping () -> Void) -> some View {
        CustomButton(.confirm, .destructive, action)
    }
    
    @ViewBuilder
    func CancelButton(_ constants: ConstantsEnum) -> some View {
        CustomButton(constants, .cancel, { })
    }
    
    @ViewBuilder
    func CustomButton(_ constants: ConstantsEnum,_ role: ButtonRole, _ action: @escaping () -> Void) -> some View {
        Button(constants.display, role: role, action: action)
    }
    
    @ViewBuilder
    func ConstantsText(_ constants: ConstantsEnum) -> some View {
        Text(constants.display)
    }
    
    func hide(_ bool: Bool) -> some View {
        modifier(HideModifier(bool))
    }
    
    func show(_ bool: Bool) -> some View {
        modifier(HideModifier(!bool))
    }
    
    
}
