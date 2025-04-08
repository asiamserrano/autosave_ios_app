//
//  ContentView.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/4/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
//    @Query private var items: [Item]
    
    @State private var search: String = .empty
    
    let status: Bool = true

    var body: some View {
    
        NavigationView {
            GameListView()
//            FilteredItemList(self.search)
//                .searchable(text: $search)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: {
                            GameEditView(status)
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
    }

    private func addItem() {
        withAnimation {
            let newGame: GameModel = .init(.random, status)
            modelContext.add(newGame)
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
}
