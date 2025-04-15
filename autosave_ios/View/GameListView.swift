//
//  GameListView.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/12/25.
//

import SwiftUI

struct GameListView: View {
    
    let comparator: GameSnapshot
    
    init(_ game: GameModel) {
        self.comparator = game.snapshot
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(self.comparator.title)
                .bold()
            HStack {
                HStack(spacing: 8) {
                    IconView(.calendar, 20, 20)
                    Text(self.comparator.release.dashes)
                        .foregroundColor(.gray)
                }
                Spacer()
            }
        }
    }
    
}
