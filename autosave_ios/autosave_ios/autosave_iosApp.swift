//
//  autosave_iosApp.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/4/25.
//

import SwiftUI
import SwiftData

@main
struct autosave_iosApp: App {
    var body: some Scene {
     
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ModelContainer.models, inMemory: false, isAutosaveEnabled: false, isUndoEnabled: true)
        .environmentObject(Configuration.defaultValue)
        
    }
}
