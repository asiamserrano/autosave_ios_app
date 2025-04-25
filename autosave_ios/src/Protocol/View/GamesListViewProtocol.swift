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
    
    var gameStatusEnum: GameStatusEnum { self.configuration.gameStatusEnum }
    var gameSortEnum: GameSortEnum { self.configuration.gameSortEnum }
    
    func setGameSortEnum(_ newValue: GameSortEnum) -> Void {
        self.configuration.gameSortEnum = newValue
    }
    
    func getGameSortEnum() -> GameSortEnum {
        self.configuration.gameSortEnum
    }
    
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
    func ModelView(_ model: GameModel) -> some View {
        NavigationLink(destination: {
            GameView(model)
        }, label: {
            let snapshot: Snapshot = model.snapshot
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
        })
        .swipeActions(edge: .trailing, content: {
            SwipeButton(.delete_game(model), label: {
                Image(.trash)
            })
        })
        .swipeActions(edge: .leading, content: {
            let move: GameStatusEnum = self.gameStatusEnum.next
            let location: String = "Move to \(move.value)"
            SwipeButton(.move_game(model, move), label: {
                Text(location)
                    .multilineTextAlignment(.center)
            })
        })
    }
    
    @ViewBuilder
    func SwipeButton(_ alert: AlertEnum, label: () -> some View) -> some View {
        Button(action: {
            self.setAlertEnum(alert)
        }, label: label)
        .tint(alert.color)
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
 
}
