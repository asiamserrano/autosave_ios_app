//
//  GameDetailView.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/11/25.
//

import SwiftUI

struct GameDetailView: GameViewProtocol {
    
    @EnvironmentObject public var builder: GameBuilder

    var body: some View {
        if isEditing {
            GameEditOnView()
        } else {
            GameEditOffView()
        }
    }
    
}

private extension GameDetailView {
    
    @ViewBuilder
    func GameEditOnView() -> some View {
        Section {
            TextFieldView($builder.title, TITLE_LABEL_STRING)
        }
        Section {
            DatePicker(RELEASE_DATE_LABEL_STRING, selection: $builder.release, displayedComponents: .date)
        }
    }
    
    @ViewBuilder
    func GameEditOffView() -> some View {
        Section {
            FormattedView(TITLE_LABEL_STRING, self.builder.title)
            FormattedView(RELEASE_DATE_LABEL_STRING, self.builder.release.long)
        }
    }
    
}
