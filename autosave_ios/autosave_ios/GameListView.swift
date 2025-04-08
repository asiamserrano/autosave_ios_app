//
//  GameListView.swift
//  autosave_ios
//
//  Created by Asia Michelle Serrano on 4/8/25.
//

import SwiftUI
import SwiftData

struct GameListView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var models: [GameModel]
    
    var body: some View {
        Form {
            ForEach(models) { item in
                NavigationLink {
                    GameEditView(item)
                } label: {
                    VStack(alignment: .leading) {
                        Text(item.title_trim)
                        Text(item.release_date)
                    }
                }
            }
            .onDelete(perform: removeItems)
        }
    }
    
    private func removeItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.remove(models[index])
            }
        }
    }
    
}
