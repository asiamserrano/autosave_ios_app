//
//  GamesListViewProtocol.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/18/25.
//

import Foundation
import SwiftUI

protocol GamesListViewProtocol: ConfigurationViewProtocol {
    var models: [GameModel] { get }
}

extension GamesListViewProtocol {
        
    @ViewBuilder
    func ModelsView(_ models: [GameModel], _ message: String, @ViewBuilder content: () -> some View) -> some View {
        if models.isEmpty {
            VStack {
                Text(message)
            }
        } else {
            content()
        }
    }
    
    @ViewBuilder
    func BottomBar() -> some View {
        Spacer()
        Menu(content: {
            Picker(String.defaultValue, selection: .init(get: self.getGameSortEnum, set: self.setGameSortEnum)) {
                ForEach(GameSortEnum.cases.reversed()) { sort in
                    HStack {
                        Text(sort.value)
                        if sort == self.gameSortEnum {
                            IconView(self.gameSortEnum.icon)
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
    
    
    
    @ViewBuilder
    func AddGameView() -> some View {
        NavigationLink(destination: {
            GameView(gameStatusEnum)
        }, label: {
            Image(.plus)
        })
    }
    
    @ViewBuilder
    func ModelView(_ model: GameModel) -> some View {
        NavigationLink(destination: {
            GameView(model)
        }, label: {
            SnapshotView(model.snapshot)
        })
        .swipeActions(edge: .trailing) { SwipeButton(.delete_game(model), .trash) }
        .swipeActions(edge: .leading) { SwipeButton(.move_game(model, move), location) }
    }
    
    @ViewBuilder
    func SnapshotView(_ snapshot: GameSnapshot) -> some View {
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
    
    
    
//    @ViewBuilder
//    func ModelView(_ model: GameModel) -> some View {
//        let snapshot: GameSnapshot = model.snapshot
//        VStack(alignment: .leading, spacing: 5) {
//            Text(snapshot.title)
//                .bold()
//            HStack {
//                HStack(spacing: 8) {
//                    IconView(.calendar, 20, 20)
//                    Text(snapshot.release.dashes)
//                        .foregroundColor(.gray)
//                }
//                Spacer()
//            }
//        }
//    }
    
}
