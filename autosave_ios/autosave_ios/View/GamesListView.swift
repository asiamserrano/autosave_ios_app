//
//  GameListView.swift
//  autosave_ios
//
//  Created by Asia Michelle Serrano on 4/8/25.
//

import SwiftUI
import SwiftData

struct GamesListView: GamesListViewProtocol {
    
    @Environment(\.modelContext) public var modelContext
    
    @EnvironmentObject var configuration: Configuration
    
    @Query var models: [GameModel]
    
    @State var search: String = .defaultValue
    
    var body: some View {
        ModelsView(models, "\(gameStatusEnum.value) is empty", content: {
            SearchView(gameStatusEnum, gameSortEnum, search)
                .searchable(text: $search)
                .toolbar {
                    ToolbarItemGroup(placement:.bottomBar, content: BottomBar)
                }
        })
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing, content: AddGameView)
        }
    }
    
    fileprivate struct SearchView: GamesListViewProtocol {
        
        @EnvironmentObject var configuration: Configuration
        
        @Query var models: [GameModel]
        
        init(_ status: GameStatusEnum, _ sort: GameSortEnum, _ search: String) {
            self._models = .init(filter: .getForList(status, search), sort: .defaultValue(sort))
        }
        
        var body: some View {
            ModelsView(models, "no results", content: {
                Form {
                    ForEach(models, content: ModelView)
                }
            })
        }
    }
    
}
