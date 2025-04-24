////
////  PlatformBuilder.swift
////  autosave_ios
////
////  Created by Asia Serrano on 4/21/25.
////
//
//import Foundation
//
//public class PlatformBuilder: ObservableObject {
//    
//    @Published var system: SystemBuilder
//    @Published var format: FormatBuilder
//    
//    public init(_ snapshot: PlatformSnapshot) {
//        self.system = snapshot.system.builder
//        self.format = snapshot.format.builder
//    }
//    
//    public init(_ model: PlatformModel) {
//        self.system = .init(model.system_value)
//        self.format = .init(model.format_value)
//    }
//    
//}

public struct PlatformBuilder {
    let system: SystemBuilder
    let format: FormatBuilder
}
