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

    
    var alertBinding: Binding<Bool> {
        .init(get: {
            self.alertEnum != .none
        }, set: { newValue in
            if newValue == false {
                self.setAlertEnum()
            }
        })
    }
    
    @ViewBuilder
    func alertMessage() -> some View {
        Text(self.alertEnum.message)
    }
    
    func setAlertEnum(_ result: GameResult? = nil) {
        self.setAlertEnum(result.alert)
    }
    
    func setAlertEnum(_ alert: AlertEnum) -> Void {
        withAnimation {
            self.configuration.alertEnum = alert
        }
    }
    
    var move: GameStatusEnum {
        self.gameStatusEnum.next
    }
    
    var location: String {
        "Move to \(self.move.value)"
    }
    
    @ViewBuilder
    func SwipeButton(_ alert: AlertEnum, _ icon: IconEnum) -> some View {
        SwipeButton(alert, label: {
            Image(icon)
        })
    }
    
    @ViewBuilder
    func SwipeButton(_ alert: AlertEnum, _ location: String) -> some View {
        SwipeButton(alert, label: {
            Text(location)
                .multilineTextAlignment(.center)
        })
    }
    
    @ViewBuilder
    func SwipeButton(_ alert: AlertEnum, label: () -> some View) -> some View {
        Button(action: {
            self.setAlertEnum(alert)
        }, label: label)
        .tint(alert.color)
    }
    
    func setGameSortEnum(_ newValue: GameSortEnum) -> Void {
        self.configuration.gameSortEnum = newValue
    }
    
    func getGameSortEnum() -> GameSortEnum {
        self.configuration.gameSortEnum
    }
    
}
