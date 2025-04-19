//
//  GameEditView.swift
//  autosave_ios
//
//  Created by Asia Michelle Serrano on 4/8/25.
//

import SwiftUI

struct GameView: ConfigurationViewProtocol, GameViewProtocol {
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var configuration: Configuration
    
    @StateObject var builder: GameBuilder
    
    public init(_ model: GameModel) {
        self._builder = .init(wrappedValue: .init(model))
    }
    
    public init(_ status: GameStatusEnum) {
        self._builder = .init(wrappedValue: .init(status))
    }
    
    var body: some View {
        Form {
            GameImageView()
            GameDetailView($builder.title, $builder.release)
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
                ConstantsText(.done)
            } else {
                ConstantsText(.edit)
            }
        })
        .disabled(self.isConfirmButtonDisabled)
    }
    
}
