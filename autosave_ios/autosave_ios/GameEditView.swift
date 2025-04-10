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
    
    @State private var showingAlert: Bool = false
    @State private var isDismissing: Bool = false
    @State private var alertMessage: String = .empty
    
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
        .alert(self.alertMessage, isPresented: $showingAlert) {
            Button("OK", role: .cancel) {
                if self.isDismissing {
//                    self.dismiss()
                }
            }
        }
        .toolbar {
            
            ToolbarItem {
                Button("Done", action: {
                    let result: (String, Bool) = modelContext.save(builder)
                    let bool: Bool = result.1
                    bool ? builder.save() : builder.fail()
                    
                    self.alertMessage = result.0
                    self.isDismissing = bool
                    self.showingAlert = true
                })
                .disabled(builder.isDisabled)
            }
            
        }
    }
    
}
