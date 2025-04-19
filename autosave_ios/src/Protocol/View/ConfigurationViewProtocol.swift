//
//  ConfigurationProtocol.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/10/25.
//

import Foundation
import SwiftUI
import SwiftData

public protocol ConfigurationViewProtocol: View {
    var configuration: Configuration { get }
}

public extension ConfigurationViewProtocol {
    
    var alertEnum: AlertEnum { configuration.alertEnum }
    var alertTitle: String { alertEnum.title }
    var menuEnum: MenuEnum { configuration.menuEnum }
    var alertBinding: Binding<Bool> { .init(get: getAlertEnum, set: setAlertEnum) }
    
    @ViewBuilder
    func alertMessage() -> some View {
        Text(alertEnum.message)
    }
    
    func getAlertEnum() -> Bool {
        switch alertEnum {
        case .none: return false
        default: return true
        }
    }
    
    func setAlertEnum(_ result: GameResult? = nil) -> Void{
        setAlertEnum(result.alert)
    }
    
    func setAlertEnum(_ alert: AlertEnum) -> Void {
        withAnimation {
            configuration.alertEnum = alert
        }
    }
    
    func setAlertEnum(_ bool: Bool) -> Void {
        if bool == false {
            setAlertEnum()
        }
    }
    
}
