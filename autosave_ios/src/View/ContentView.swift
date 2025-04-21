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
        NavigationLink(destination: {
            TempJunctionView(property)
        }, label: {
            let snapshot: PropertySnapshot = property.snapshot
            FormattedView(snapshot.key.trim, snapshot.value.trim)
        })
    }
    
}

private struct TempJunctionView: View {
    
    @Query var models: [JunctionModel]
    
    init(_ model: PropertyModel) {
        self._models = Query(.getByProperty(model))
    }
    
    var body: some View {
        TempGamesView(models)
    }
    
}

private struct TempGamesView: View {
    
    @Query var models: [GameModel]
    
    init(_ junctions: [JunctionModel]) {
        self._models = Query(.getByJunctions(junctions))
    }
    
    var body: some View {
        Form {
            ForEach(models) { model in
                let snapshot: GameSnapshot = model.snapshot
                VStack(alignment: .leading, spacing: 5) {
                    Text(snapshot.title)
                        .bold()
                    HStack {
                        HStack(spacing: 8) {
                            IconView(.calendar, 20, 20)
                            Text(snapshot.release.dashes)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                    }
                }
            }
        }
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
        
        func createProperties(_ max: Int) -> [PropertySnapshot] {
            var array: [PropertySnapshot] = .init()
            var snapshot: PropertySnapshot
            for _ in 0..<max {
                snapshot = .random(.random)
                array.append(snapshot)
            }
            return array
        }
        
        func createGames(_ max: Int) -> [GameSnapshot] {
            var array: [GameSnapshot] = .init()
            var snapshot: GameSnapshot
            for _ in 0..<max {
                snapshot = .random(.library)
                array.append(snapshot)
            }
            return array
        }
        
        let properties: [PropertyModel] = createProperties(40).map(container.mainContext.save)
        let games: [GameModel] = createGames(10).map(container.mainContext.save)
        
        for _ in 0..<20 {
            let snapshot: JunctionSnapshot = .init(games.random, properties.random)
            container.mainContext.save(snapshot)
        }
        
        container.mainContext.clean()
        
        print("original properties size: \(properties.count)")
        print("original properties size: \(games.count)")
            
        return container

    }()

    return ContentView()
        .modelContainer(previewModelContainer)
        .environmentObject(Configuration.defaultValue)
}
