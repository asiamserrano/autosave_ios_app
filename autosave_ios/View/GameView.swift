//
//  GameEditView.swift
//  autosave_ios
//
//  Created by Asia Michelle Serrano on 4/8/25.
//

import SwiftUI

struct GameView: ConfigurationViewProtocol, GameViewProtocol {
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var configuration: Configuration
    
    @StateObject var builder: GameBuilder
    
    let isNewGame: Bool
    
    public init(_ model: GameModel) {
        self.isNewGame = false
        self._builder = .init(wrappedValue: .init(model))
    }
    
    public init(_ status: Bool) {
        self.isNewGame = true
        self._builder = .init(wrappedValue: .init(status))
    }
    
    var body: some View {
        Form {
            GameImageView()
            GameDetailView()
//            GamePropertiesView()
        }
//        .navigationDestination(isPresented: navigateBinding, destination: NavigationDestinationView)
        .environmentObject(self.builder)
        .environment(\.editMode, self.editModeBinding)
        .navigationBarBackButtonHidden(isBackButtonHidden)
        .toolbar {
            
            ToolbarItem(placement: .topBarTrailing, content: ConfirmButton)
            
            if self.isBackButtonHidden {
                ToolbarItem(placement: .topBarLeading, content: CancelButton)
            }
            
        }
    }
    
}

private extension GameView {
    
    var isBackButtonHidden: Bool {
        self.isNewGame ? false : self.isEditing
    }
//    
//    func confirm() {
//        let result: GameResult = modelContext.save(builder)
//        if result.successful {
//            self.builder.save()
//            self.dismiss()
//        } else {
//            self.builder.fail()
//        }
//        self.setAlertEnum(result)
//    }
//    
    @ViewBuilder
    func CancelButton() -> some View {
        Button(action: {
            self.builder.cancel()
        }, label: {
            Text(CANCEL_LABEL_STRING)
        })
    }
    
    @ViewBuilder
    func ConfirmButton() -> some View {
        Button(action: {
            if self.isEditing {
                let result: GameResult = self.modelContext.save(self.builder)
                if result.successful {
                    self.builder.save()
                    self.dismiss()
                } else {
                    self.builder.fail()
                }
                self.setAlertEnum(result)
            } else {
                self.toggleEditMode()
            }
        }, label: {
            if self.isEditing {
                Text(DONE_LABEL_STRING)
            } else {
                Text(EDIT_LABEL_STRING)
            }
        })
        .disabled(self.isEditing ? self.builder.isDisabled : false)
    }
    
}
