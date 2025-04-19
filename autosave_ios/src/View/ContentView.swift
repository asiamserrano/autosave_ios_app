//
//  ContentView.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/4/25.
//

import SwiftUI
import SwiftData

struct ContentView: ConfigurationViewProtocol {
    
    @Environment(\.modelContext) public var modelContext
               
    @EnvironmentObject var configuration: Configuration
    
//    let status: Bool = true
    
    var body: some View {
        NavigationView {
            GamesListView()
                .alert(alertTitle, isPresented: alertBinding, actions: AlertActions, message: alertMessage)
        }
        .environmentObject(self.configuration)
    }

    
    @ViewBuilder
    private func AlertActions() -> some View {
        switch self.alertEnum {
        case .delete_game(let game):
            DeleteButton(game)
            CancelButton(.cancel)
        case .move_game(let game, let status):
            MoveButton(game, status)
            CancelButton(.cancel)
//        case .delete_tag(let tag):
//            DeleteButton(tag)
//            CancelButton(CANCEL_LABEL_STRING)
        default:
            CancelButton(.ok)
        }
    }
    
    @ViewBuilder
    func DeleteButton(_ game: GameModel) -> some View {
        ConfirmButton({ self.modelContext.remove(game) })
    }
    
    @ViewBuilder
    func MoveButton(_ game: GameModel, _ status: GameStatusEnum) -> some View {
        ConfirmButton({ self.modelContext.move(game, status) })
    }
    
}

#Preview {
    let previewModelContainer: ModelContainer = {
        
        let container: ModelContainer = .preview
        
        container.mainContext.autosaveEnabled = false
        container.mainContext.undoManager = .init()
        
        var snapshot: GameSnapshot
        
        for _ in 0..<0 {
            snapshot = .random(.library)
            container.mainContext.save(snapshot)
        }
        
        return container

    }()

    return ContentView()
        .modelContainer(previewModelContainer)
        .environmentObject(Configuration.defaultValue)
}
