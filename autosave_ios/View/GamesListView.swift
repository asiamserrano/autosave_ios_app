//
//  GameListView.swift
//  autosave_ios
//
//  Created by Asia Michelle Serrano on 4/8/25.
//

import SwiftUI
import SwiftData

struct GamesListView: ConfigurationViewProtocol {
    
    @Environment(\.modelContext) private var modelContext
    
    @EnvironmentObject var configuration: Configuration
    
    @Query private var models: [GameModel]
    
    @State var search: String = .defaultValue
    
    var body: some View {
        if models.isEmpty {
            VStack {
                Text("\(gameStatusEnum.value) is empty")
            }
        } else {
            Form {
                ForEach(models) { model in
                    NavigationLink(destination: {
                        GameView(model)
                    }, label: {
                        GameListView(model)
                    })
                    .swipeActions(edge: .trailing) { SwipeButton(.delete_game(model), .trash) }
                    .swipeActions(edge: .leading) { SwipeButton(.move_game(model, move), location) }
                }
            }
            .searchable(text: $search)
        }
    }
    
}

//struct GamesListView: ConfigurationViewProtocol {
//    
//    @Environment(\.modelContext) private var modelContext
//
//    @EnvironmentObject var configuration: Configuration
//            
//    @State var message: String = .defaultValue
//    @State var count: Int = 0
////    @State var bool: Bool = true
////        @State var navigate: Bool = false
//    
//        
//    func update(_ new: Int) -> Void {
//        self.count = new
//    }
//    
//    
//    var body: some View {
//        
//        
////        FilteredView(gameStatusEnum, gameSortEnum, canon)
//        MainView()
////            .onChange(of: self.modelContext.gameCount, perform: self.update)
////                .navigationDestination(isPresented: $navigate, destination: {
////                    GameView(configuration)
////                })
//            .toolbar {
////                    ToolbarItem(placement: .navigationBarTrailing, content: PlusButton)
//                
////                ToolbarItem {
////                    Button(action: addItem) {
////                        Label("Add Item", systemImage: "plus")
////                    }
////                }
//                
//                ToolbarItem(placement: .navigationBarTrailing, content: {
//                    Button("Add") {
//                        withAnimation {
//                            let newGame: GameModel = .init(.random, gameStatusEnum)
//                            modelContext.add(newGame)
//                        }
//                    }
//                })
//                
////                ToolbarItemGroup(placement:.bottomBar, content: BottomBar)
//            }
//    }
//    
//    @ViewBuilder
//    func MainView() -> some View {
//        if self.modelContext.gameCount == 0 {
//            EmptyView("empty library")
//        } else {
//            FilteredView()
//            .searchable(text: $message)
//        }
//    }
//    
//    var search: String {
//        self.message.canonicalize()
//    }
//    
//    func filter(_ string: String) -> Bool {
//        switch search.count {
//        case 0: return true
//        case 1: return string.starts(with: search)
//        default: return string.contains(search)
//        }
//    }
//    
//    fileprivate struct EmptyView: View {
//        
//        let message: String
//        
//        init(_ message: String) {
//            self.message = message
//        }
//        
//        var body: some View {
//            VStack {
//                Text(message)
//            }
//        }
//        
//    }
//    
//    fileprivate struct FilteredView: ConfigurationViewProtocol {
//        @EnvironmentObject var configuration: Configuration
//        @Query private var models: [GameModel]
//        
//        var body: some View {
//            Form {
//                ForEach(models) { model in
//                    NavigationLink(destination: {
//                        GameView(model)
//                    }, label: {
//                        GameListView(model)
//                    })
//                    .swipeActions(edge: .trailing) { SwipeButton(.delete_game(model), .trash) }
//                    .swipeActions(edge: .leading) { SwipeButton(.move_game(model, move), location) }
//                }
//            }
//        }
//    }
//        
////    fileprivate struct FilteredView: ConfigurationViewProtocol {
////                
////        @EnvironmentObject var configuration: Configuration
////                        
////        @Query private var models: [GameModel]
////        
////        let inactive: Bool
////         
////        init(_ status: GameStatusEnum, _ sort: GameSortEnum, _ canon: String) {
////            self.inactive = canon.isEmpty
////            self._models = Query(filter: .getForList(status, canon), sort: .defaultValue(sort))
////        }
////   
////        var body: some View {
////            if models.isEmpty {
////                EmptyView("no results")
////            } else {
////                GameModelsView(models)
////            }
////        }
////        
////    }
////    
////    fileprivate struct GameModelsView: ConfigurationViewProtocol {
////        
////        @EnvironmentObject var configuration: Configuration
////        
////        let models: [GameModel]
////        
////        init(_ models: [GameModel]) {
////            self.models = models
////        }
////   
////        var body: some View {
////            Form {
////                ForEach(models) { model in
////                    NavigationLink(destination: {
////                        GameView(model)
////                    }, label: {
////                        GameListView(model)
////                    })
////                    .swipeActions(edge: .trailing) { SwipeButton(.delete_game(model), .trash) }
////                    .swipeActions(edge: .leading) { SwipeButton(.move_game(model, move), location) }
////                }
////            }
////            
////        }
////    }
//
//}
//
//
//private extension GamesListView {
//    
//    var canon: String {
//        self.search.canonicalize()
//    }
//    
//    var isSearchInactive: Bool {
//        self.canon.isEmpty
//    }
//        
////    @ViewBuilder
////    func PlusButton() -> some View {
////        Button(action: {
//////            self.navigate.toggle()
////        }, label: {
////            Image(.plus)
////        })
////    }
////    
////    @ViewBuilder
////    func BottomBar() -> some View {
////        Spacer()
////        Menu(content: {
////            Picker(String.defaultValue, selection: .init(get: self.getGameSortEnum, set: self.setGameSortEnum)) {
////                ForEach(GameSortEnum.cases.reversed()) { sort in
////                    HStack {
////                        Text(sort.value)
////                        if sort == self.gameSortEnum {
////                            IconView(self.gameSortEnum.icon)
////                        }
////                    }
////                    .tag(sort)
////                }
////            }
////        }, label: {
////            Image(.ellipsis_circle)
////        })
////        .menuStyle(.borderlessButton)
////    }
//    
//}
