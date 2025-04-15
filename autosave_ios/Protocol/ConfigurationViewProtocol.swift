//
//  ConfigurationProtocol.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/10/25.
//

import Foundation
import SwiftUI

public protocol ConfigurationViewProtocol: View {
    var configuration: Configuration { get }
}

public extension ConfigurationViewProtocol {
    
    var alertEnum: AlertEnum { self.configuration.alertEnum }
    var alertTitle: String { self.alertEnum.title }
    
    var menuEnum: MenuEnum { self.configuration.menuEnum }
    
    var gameStatusEnum: GameStatusEnum { self.configuration.gameStatusEnum }
    var gameSortEnum: GameSortEnum { self.configuration.gameSortEnum }
    
    var gameSortBinding: Binding<GameSortEnum> {
        .init(get: {
            self.gameSortEnum
        }, set: { newValue in
            self.configuration.gameSortEnum = newValue == gameSortEnum ? gameSortEnum.toggle : gameSortEnum.next
        })
    }

    @ViewBuilder
    func alertMessage() -> some View {
        Text(self.alertEnum.message)
    }
    
    func setAlertEnum(_ result: GameResult? = nil) {
        self.setAlertEnum(result.alert)
    }
    
    @ViewBuilder
    func SwipeButton(_ alert: AlertEnum, _ icon: IconEnum, _ color: Color) -> some View {
        SwipeButton(icon, color, action: {
            self.setAlertEnum(alert)
        })
    }
    
//    @ViewBuilder
//    func SwipeButton(_ model: TagModel, _ icon: IconEnum, _ color: Color) -> some View {
//        SwipeButton(icon, color, action: {
//            self.configuration.setTagModel(model)
//        })
//    }
    
    @ViewBuilder
    func SwipeButton(_ icon: IconEnum, _ color: Color, action: @escaping () -> Void) -> some View {
        Button(action: {
            withAnimation {
                action()
            }
        }, label: {
            Image(icon)
        })
        .tint(color)
    }
}

private extension ConfigurationViewProtocol {
    
    private func setAlertEnum(_ alert: AlertEnum) -> Void {
        self.configuration.alertEnum = alert
    }
    
}
