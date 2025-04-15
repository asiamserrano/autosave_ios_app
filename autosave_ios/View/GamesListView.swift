//
//  GameListView.swift
//  autosave_ios
//
//  Created by Asia Michelle Serrano on 4/8/25.
//

import SwiftUI
import SwiftData

struct GamesListView: ConfigurationViewProtocol {
    
    @EnvironmentObject var configuration: Configuration
    
    var body: some View {
        SearchView(gameStatusEnum, $configuration.gameSortEnum)
    }
    
    fileprivate struct SearchView: View {
                
        @State var search: String = .defaultValue
//        @State var navigate: Bool = false
        
        @Binding var sort: GameSortEnum
        
        let status: GameStatusEnum
            
        init(_ status: GameStatusEnum, _ sort: Binding<GameSortEnum>) {
            self.status = status
            self._sort = sort
        }
        
        var body: some View {
            QueryView(status, sort, $search)
//                .navigationDestination(isPresented: $navigate, destination: {
//                    GameView(configuration)
//                })
                .toolbar {
//                    ToolbarItem(placement: .navigationBarTrailing, content: PlusButton)
                    ToolbarItemGroup(placement:.bottomBar, content: BottomBar)
                }
        }
    }
    
    fileprivate struct QueryView: View {
        
//        @Environment(\.modelContext) private var modelContext
                
        @Query private var models: [GameModel]
//        
        private var search: Binding<String>
        
        let inactive: Bool
        
        init(_ status: GameStatusEnum, _ sort: GameSortEnum, _ search: Binding<String>) {
            let canon: String = search.wrappedValue.canonicalize()
            self.inactive = canon.isEmpty
            self.search = search
            self._models = Query(filter: .getForList(status, canon), sort: .defaultValue(sort))
        }
   
        var body: some View {
            ListView(models, inactive)
                .searchable(text: self.search)
        }
        
    }
    
    fileprivate struct ListView: ConfigurationViewProtocol {
        
        @EnvironmentObject var configuration: Configuration
        
        let models: [GameModel]
        let message: String
        
        init(_ models: [GameModel], _ inactive: Bool) {
            self.models = models
            self.message = inactive ? "empty library" : "no results"
        }
        
        var body: some View {
            if models.isEmpty {
                VStack {
                    Text(message)
                }
            } else {
                Form {
                    ForEach(models) { model in
                        GameNavigationLink(model)
                            .swipeActions(edge: .trailing) { SwipeButton(.delete_game(model), .trash, .red) }
                            .swipeActions(edge: .leading) { SwipeButton(.move_game(model, move), .plus_circle, .green) }
                    }
                }
            }
        }
        
    }
    
//    private struct SearchView: View {
//        
//        @State var search: String = .defaultValue
//        @State var navigate: Bool = false
//        
//        let status: GameStatusEnum
//        let sort: GameSortEnum
//            
//        init(_ status: GameStatusEnum, _ sort: GameSortEnum) {
//            self.status = status
//            self.sort = sort
//        }
//        
//        var body: some View {
//            InnerView(status, sort, search)
//                .searchable(text: $search)
//                .navigationDestination(isPresented: $navigate, destination: {
//                    GameView(configuration)
//                })
//                .toolbar {
//                    ToolbarItem(placement: .navigationBarTrailing, content: PlusButton)
//                    ToolbarItemGroup(placement:.bottomBar, content: BottomBar)
//                }
//        }
//
//    }
    
//    @Environment(\.modelContext) private var modelContext
//    @Query private var models: [GameModel]
//        
//    var body: some View {
//        Form {
//            ForEach(models) { model in
//                NavigationLink {
//                    GameView(model)
//                } label: {
//                    GameListView(model)
//                }
//            }
//            .onDelete(perform: remove)
//        }
//    }
    
}

private extension GamesListView.ListView {
    
    @ViewBuilder
    func GameNavigationLink(_ model: GameModel) -> some View {
        NavigationLink {
            GameView(model)
        } label: {
            GameListView(model)
        }
    }
    
    var move: GameStatusEnum {
        self.gameStatusEnum.next
    }
    
}

private extension GamesListView.SearchView {
    
    var canon: String {
        self.search.canonicalize()
    }
    
    var isSearchInactive: Bool {
        self.canon.isEmpty
    }
    
    
        
    @ViewBuilder
    func PlusButton() -> some View {
        Button(action: {
//            self.navigate.toggle()
        }, label: {
            Image(.plus)
        })
    }
    
    @ViewBuilder
    func BottomBar() -> some View {
        Spacer()
        Menu(content: {
            Picker(String.defaultValue, selection: self._sort) {
                ForEach(GameSortEnum.cases) { sort in
                    HStack {
                        Text(sort.value)
                        if sort == self.sort {
                            IconView(self.sort.icon)
                        }
                    }
                    .tag(sort)
                }
            }
        }, label: {
            Image(.ellipsis_circle)
        })
        .menuStyle(.borderlessButton)
    }
    
}

//private extension GamesListView {
//    
//    private func remove(offsets: IndexSet) {
//        withAnimation {
//            offsets.forEach { offset in
//                let model: GameModel = self.models[offset]
//                self.modelContext.remove(model)
//            }
//        }
//    }
//    
//}
