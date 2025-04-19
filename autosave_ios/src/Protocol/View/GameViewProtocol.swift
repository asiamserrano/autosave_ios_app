//
//  GameView.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/11/25.
//

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
    var isBoxartEmpty: Bool { self.boxart == nil }
    
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
    
//    var titleBinding: Binding<String> {
//        .init(get: {
//            self.builder.title
//        }, set: { newValue in
//            self.builder.title = newValue
//        })
//    }
//    
//    var releaseBinding: Binding<Date> {
//        .init(get: {
//            self.builder.release
//        }, set: { newValue in
//            self.builder.release = newValue
//        })
//    }
    
    var isBackButtonHidden: Bool {
        self.builder.isNew ? false : self.isEditing
    }
    
    var isConfirmButtonDisabled: Bool {
        self.isEditing ? self.builder.isDisabled : false
    }
    
    @ViewBuilder
    func ImageView() -> some View {
        let uiimage: UIImage = UIImage(self.boxart)
        let deviceImage: Image = Image(uiimage)
        if self.isBoxartEmpty {
            deviceImage
                .resizable()
                .scaledToFit()
                .frame(maxWidth: appScreenWidth, alignment: .center)
                .foregroundColor(.gray)
                .padding()
            
        } else {
            deviceImage
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
                .shadow(radius: 10)
                .padding()
        }
    }
    
    @ViewBuilder
    func GameDetailView(_ titleBinding: Binding<String>, _ releaseBinding: Binding<Date>) -> some View {
        if isEditing {
            Section {
                TextFieldView(.title, titleBinding)
            }
            Section {
                DatePicker(selection: releaseBinding, displayedComponents: .date, label: {
                    ConstantsText(.release_date)
                })
            }
        } else {
            Section {
                FormattedView(.title, self.builder.title)
                FormattedView(.release_date, self.builder.release.long)
            }
        }
    }
    
    @ViewBuilder
    func CancelButton() -> some View {
        Button(action: {
            self.builder.cancel()
        }, label: {
            ConstantsText(.cancel)
        })
    }
    
//    var boxart: Data? { self.observer.boxart }
//    var statusEnum: GameStatusEnum { self.observer.statusEnum }
//    var propertyEnum: PropertyEnum { self.observer.propertyEnum }
//    var properties: PropertyBuilderGroup { self.observer.properties }

}
