//
//  ContentView.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/4/25.
//

import SwiftUI
import SwiftData

struct ContentView: ConfigurationViewProtocol {
    
    @Environment(\.modelContext) private var modelContext
    
//    @State private var search: String = .defaultValue
    
    @EnvironmentObject var configuration: Configuration
    
    let status: Bool = true

    var body: some View {
        NavigationView {
            GamesListView()
                .alert(alertTitle, isPresented: alertBinding, actions: AlertActions, message: alertMessage)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: {
                            GameView(status)
                        }, label: {
                            Text("Add Game")
                        })
                    }
                    ToolbarItem {
                        Button(action: addItem) {
                            Label("Add Item", systemImage: "plus")
                        }
                    }
                }
        }
        .environmentObject(self.configuration)
    }

    private func addItem() {
        withAnimation {
            let newGame: GameModel = .init(.random, status)
            modelContext.add(newGame)
        }
    }
    
    private var alertBinding: Binding<Bool> {
        .init(get: {
            self.alertEnum != .none
        }, set: { newValue in
            if newValue == false {
                self.setAlertEnum()
            }
        })
    }
    
    @ViewBuilder
    private func AlertActions() -> some View {
        switch self.alertEnum {
//        case .delete_game(let game):
//            DeleteButton(game)
//            CancelButton(CANCEL_LABEL_STRING)
//        case .move_game(let game, let status):
//            MoveButton(game, status)
//            CancelButton(CANCEL_LABEL_STRING)
//        case .delete_tag(let tag):
//            DeleteButton(tag)
//            CancelButton(CANCEL_LABEL_STRING)
        default:
            CancelButton(OK_LABEL_STRING)
        }
    }
    
}

#Preview {
    let previewModelContainer: ModelContainer = {
        
        let container: ModelContainer = .preview
        
        container.mainContext.autosaveEnabled = false
        container.mainContext.undoManager = .init()
        
        return container

    }()

    return ContentView()
        .modelContainer(previewModelContainer)
        .environmentObject(Configuration.defaultValue)
}
