////
////  PropertyBuilder.swift
////  autosave_ios
////
////  Created by Asia Serrano on 4/19/25.
////
//
//import Foundation
//
//public class PropertyBuilder: ObservableObject {
//    
//    public let type: PropertyEnum
//    @Published var value: String
//    
//    public init(_ type: PropertyEnum) {
//        self.type = type
//        self.value = .defaultValue
//    }
//    
//    public init(_ snapshot: PropertySnapshot) {
//        self.type = snapshot.type
//        self.value = snapshot.value.trim
//    }
//    
//    public convenience init(_ model: PropertyModel) {
//        let snapshot: PropertySnapshot = model.snapshot
//        self.init(snapshot)
//    }
//    
//}
//
//extension PropertyBuilder: PropertyProtocol {
//    
//    public var value_trim: String {
//        self.value.trim()
//    }
//    
//}
