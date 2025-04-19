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
        HStack {
            HStack {
                ConstantsText(constants)
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
        Button(constants.value, role: role, action: action)
    }
    
    @ViewBuilder
    func ConstantsText(_ constants: ConstantsEnum) -> some View {
        Text(constants.value)
    }
    
    func hide(_ bool: Bool) -> some View {
        modifier(HideModifier(bool))
    }
    
    func show(_ bool: Bool) -> some View {
        modifier(HideModifier(!bool))
    }
    
    
}
