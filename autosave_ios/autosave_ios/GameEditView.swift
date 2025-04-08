//
//  GameEditView.swift
//  autosave_ios
//
//  Created by Asia Michelle Serrano on 4/8/25.
//

import SwiftUI

struct GameEditView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    @StateObject var builder: GameBuilder
    
    public init(_ model: GameModel) {
        self._builder = .init(wrappedValue: .init(model))
    }
    
    public init(_ status: Bool) {
        self._builder = .init(wrappedValue: .init(status))
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Title", text: $builder.title)
                DatePicker("Release Date", selection: $builder.release, displayedComponents: .date)
            }
        }
        .toolbar {
            
            ToolbarItem {
                Button("Done", action: {
                    let isNew: Bool = builder.isNew
                    let model: GameModel = builder.save()
                    if isNew {
                        self.modelContext.add(model)
                    } else {
                        self.modelContext.store()
                    }
                    self.dismiss()
                })
                .disabled(builder.isDisabled)
            }
        }
    }
    
}
