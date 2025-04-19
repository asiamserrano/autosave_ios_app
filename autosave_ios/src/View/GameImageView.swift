////
////  GameImageView.swift
////  autosave_ios
////
////  Created by Asia Serrano on 4/11/25.
////
//
//import SwiftUI
//
//import SwiftUI
//import PhotosUI
//
//struct GameImageView: GameViewProtocol {
//    
//    @EnvironmentObject public var builder: GameBuilder
//    
//    @State private var photosPickerItem: PhotosPickerItem? = nil
//    @State private var picker: ImagePickerEnum = .picker
//    
//    var body: some View {
//        if self.isLibrary {
//            Section {
//                VStack(alignment: .center) {
//                    ImageView()
//                        .onTapGesture(count: 2, perform: self.tapAction)
//                    if self.isEditing {
//                        EditView()
//                    }
//                }
//            }
//        }
//    }
//    
//}
//
//private extension GameImageView {
//    
//    enum ImagePickerEnum: Enumerable {
//        case picker, paste
//    }
//    
//    func setData(_ data: Data?, _ picker: ImagePickerEnum) -> Void {
//        withAnimation {
//            self.builder.boxart = data
//            self.setPicker(picker)
//        }
//    }
//    
//    func setPicker(_ picker: ImagePickerEnum) -> Void {
//        self.picker = picker
//    }
//    
//    func resetPhotosPickerItem() -> Void {
//        self.photosPickerItem = nil
//    }
//    
//    func tapAction() -> Void {
//        if self.isEditing, let image: UIImage = UIPasteboard.general.images?.first {
//            self.setData(image.data, .paste)
//            self.resetPhotosPickerItem()
//        }
//    }
//    
//    func pickerAction(_ old: PhotosPickerItem?, _ new: PhotosPickerItem?) -> Void {
//        if self.picker == .paste {
//            self.setPicker(.picker)
//        } else {
//            Task {
//                let data: Data? = try? await self.photosPickerItem?.loadTransferable(type: Data.self)
//                self.setData(data, .picker)
//            }
//        }
//    }
//    
//    @ViewBuilder
//    func EditView() -> some View {
//        HStack {
//            PhotosPicker(selection: $photosPickerItem, matching: .images, photoLibrary: .shared()) {
//                ConstantsText(self.isBoxartEmpty ? .add : .edit).bold()
//            }
//            .onChange(of: self.photosPickerItem, self.pickerAction)
//            
//            if !self.isBoxartEmpty {
//                Button(action: self.resetPhotosPickerItem, label: {
//                    ConstantsText(.delete).bold()
//                })
//            }
//            
//        }
//        .buttonStyle(.borderless)
//    }
//    
//}
