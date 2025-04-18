//
//  GameView.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/11/25.
//

import Foundation

import Foundation
import SwiftUI

public protocol GameViewProtocol: View {
    var builder: GameBuilder { get }
}

public extension GameViewProtocol {

    var isEditing: Bool { self.editMode == .active }
    var isLibrary: Bool { self.status == .library }
    var boxart: Data? { self.builder.boxart }
    var status: GameStatusEnum { self.builder.status }
    
    var editMode: EditMode { self.builder.editMode }
 
    func setBoxart(_ data: Data?) -> Void {
        self.builder.boxart = data
    }
    
    func setEditMode(_ mode: EditMode) -> Void {
        self.builder.editMode = mode
    }
    
    func toggleEditMode() -> Void {
        let mode: EditMode = self.editMode.next
        self.setEditMode(mode)
    }
    
    var editModeBinding: Binding<EditMode> {
        .init(get: { self.editMode }, set: self.setEditMode)
    }
    
    var titleBinding: Binding<String> {
        .init(get: {
            self.builder.title
        }, set: { newValue in
            self.builder.title = newValue
        })
    }
    
    var releaseBinding: Binding<Date> {
        .init(get: {
            self.builder.release
        }, set: { newValue in
            self.builder.release = newValue
        })
    }
    
    @ViewBuilder
    func GameDetailView() -> some View {
        if isEditing {
            GameEditOnView()
        } else {
            GameEditOffView()
        }
    }
    
    @ViewBuilder
    func GameEditOnView() -> some View {
        Section {
            TextFieldView(.title, titleBinding)
        }
        Section {
            DatePicker(selection: releaseBinding, displayedComponents: .date, label: {
                ConstantsText(.release_date)
            })
        }
    }
    
    @ViewBuilder
    func GameEditOffView() -> some View {
        Section {
            FormattedView(.title, self.builder.title)
            FormattedView(.release_date, self.builder.release.long)
        }
    }
    
//    var boxart: Data? { self.observer.boxart }
//    var statusEnum: GameStatusEnum { self.observer.statusEnum }
//    var propertyEnum: PropertyEnum { self.observer.propertyEnum }
//    var properties: PropertyBuilderGroup { self.observer.properties }

}
