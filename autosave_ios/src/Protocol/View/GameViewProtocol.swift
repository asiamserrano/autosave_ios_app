//
//  GameView.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/11/25.
//

import Foundation
import SwiftUI
import PhotosUI
import SwiftData

public protocol GameViewProtocol: ConfigurationViewProtocol {
    var builder: GameBuilder { get }
}

public extension GameViewProtocol {

    var isEditing: Bool { self.editMode == .active }
    var isLibrary: Bool { self.status == .library }
    var boxart: Data? { self.builder.boxart }
    var status: GameStatusEnum { self.builder.status }
    var isBoxartEmpty: Bool { self.boxart == nil }
    var imagePicker: ImagePickerEnum { self.builder.imagePicker }
    var photosPickerItem: PhotosPickerItem? { self.builder.photosPickerItem }
    var editMode: EditMode { self.builder.editMode }
    var isBackButtonHidden: Bool { self.builder.isNew ? false : self.isEditing }
    var isConfirmButtonDisabled: Bool { self.isEditing ? self.builder.isDisabled : false }
 
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
    
    func setData(_ data: Data?, _ picker: ImagePickerEnum) -> Void {
        withAnimation {
            self.builder.boxart = data
            self.setPicker(picker)
        }
    }
    
    func setPicker(_ picker: ImagePickerEnum) -> Void {
        self.builder.imagePicker = picker
    }
    
    func resetPhotosPickerItem() -> Void {
        self.builder.photosPickerItem = nil
    }
    
//    var boxart: Data? { self.observer.boxart }
//    var statusEnum: GameStatusEnum { self.observer.statusEnum }
//    var propertyEnum: PropertyEnum { self.observer.propertyEnum }
//    var properties: PropertyBuilderGroup { self.observer.properties }

}
