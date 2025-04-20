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
        
    
    @Query var models: [PropertyModel]
    
    var body: some View {
        NavigationView {
//            GamesListView()
//                .alert(alertTitle, isPresented: alertBinding, actions: AlertActions, message: alertMessage)
            Form {
                ForEach(models, content: PropertyView)
            }
            .toolbar {
                
                ToolbarItem(placement: .topBarTrailing, content: {
                    Button(action: {
                        let property: PropertySnapshot = .random(.random)
                        self.modelContext.save(property)
                    }, label: {
                        Image(.plus)
                    })
                })
                
            }
        }
        .environmentObject(self.configuration)
    }
        
    @ViewBuilder
    func PropertyView(_ property: PropertyModel) -> some View {
        let snapshot: PropertySnapshot = property.snapshot
        FormattedView(snapshot.key.trim, snapshot.value.trim)
    }
    
}

private extension ContentView {
    
    @ViewBuilder
    func AlertActions() -> some View {
        switch self.alertEnum {
        case .delete_game(let game):
            ConfirmButton({ self.modelContext.remove(game) })
            CancelButton(.cancel)
        case .move_game(let game, let status):
            ConfirmButton({ self.modelContext.move(game, status) })
            CancelButton(.cancel)
//        case .delete_tag(let tag):
//            DeleteButton(tag)
//            CancelButton(CANCEL_LABEL_STRING)
        default:
            CancelButton(.ok)
        }
    }
    
}

#Preview {
    let previewModelContainer: ModelContainer = {
        
        let container: ModelContainer = .preview
        
        container.mainContext.autosaveEnabled = false
        container.mainContext.undoManager = .init()
        
        var game: GameSnapshot
        var property: PropertySnapshot
        
        let max: Int = 10
        
        for _ in 0..<max {
            game = .random(.library)
            container.mainContext.save(game)
            property = .random(.random)
            container.mainContext.save(property)
        }
        
        return container

    }()

    return ContentView()
        .modelContainer(previewModelContainer)
        .environmentObject(Configuration.defaultValue)
}
