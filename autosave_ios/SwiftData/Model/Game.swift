//
//  Game.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/4/25.
//

import Foundation

@Model
public class GameModel {
    
    public private(set) var uuid: UUID
    public private(set) var title_str: String
    public private(set) var release_str: String
    public private(set) var status_bool: Bool
    
    public init() {
        self.uuid = UUID()
        self.title_str = ""
        self.release_str = ""
        self.status_bool = false
    }
}
