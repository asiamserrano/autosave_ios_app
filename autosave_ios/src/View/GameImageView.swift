//
//  GameImageView.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/11/25.
//

import SwiftUI

import SwiftUI
import PhotosUI

struct GameImageView: GameViewProtocol {
    
    @EnvironmentObject public var builder: GameBuilder
    
    @State private var photosPickerItem: PhotosPickerItem? = nil
    @State private var picker: PickerEnum = .picker
    
    var body: some View {
        if self.isLibrary {
            Section {
                VStack(alignment: .center) {
                    ImageView()
                        .onTapGesture(count: 2, perform: self.tapAction)
                    if self.isEditing {
                        EditView()
                    }
                }
            }
        }
    }
    
}

private extension GameImageView {
    
    enum PickerEnum: Enumerable {
        case picker, paste
    }
    
    var isEmpty: Bool { self.boxart == nil }
    
    var uiimage: UIImage { .init(self.boxart) }
    
    func setData(_ data: Data?, _ picker: PickerEnum) -> Void {
        withAnimation {
            self.builder.boxart = data
            self.setPicker(picker)
        }
    }
    
    func setPicker(_ picker: PickerEnum) -> Void {
        self.picker = picker
    }
    
    func resetPhotosPickerItem() -> Void {
        self.photosPickerItem = nil
    }
    
    func tapAction() -> Void {
        if self.isEditing, let image: UIImage = UIPasteboard.general.images?.first {
            self.setData(image.data, .paste)
            self.resetPhotosPickerItem()
        }
    }
    
    func pickerAction(_ old: PhotosPickerItem?, _ new: PhotosPickerItem?) -> Void {
        if self.picker == .paste {
            self.setPicker(.picker)
        } else {
            Task {
                let data: Data? = try? await self.photosPickerItem?.loadTransferable(type: Data.self)
                self.setData(data, .picker)
            }
        }
    }
    
    @ViewBuilder
    func ImageView() -> some View {
        let deviceImage: Image = Image(self.uiimage)
        if self.isEmpty {
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
    func EditView() -> some View {
        HStack {
            PhotosPicker(selection: $photosPickerItem, matching: .images, photoLibrary: .shared()) {
                ConstantsText(self.isEmpty ? .add : .edit).bold()
            }
            .onChange(of: self.photosPickerItem, self.pickerAction)
            
            if !self.isEmpty {
                Button(action: self.resetPhotosPickerItem, label: {
                    ConstantsText(.delete).bold()
                })
            }
            
        }
        .buttonStyle(.borderless)
    }
    
}
