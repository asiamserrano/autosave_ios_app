//
//  GameEditView.swift
//  autosave_ios
//
//  Created by Asia Michelle Serrano on 4/8/25.
//

import SwiftUI
import PhotosUI

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
            GameImageView($builder.photosPickerItem)
            GameDetailView($builder.title, $builder.release)
//            GamePropertiesView()
        }
//        .navigationDestination(isPresented: navigateBinding, destination: NavigationDestinationView)
        .environmentObject(self.builder)
        .environment(\.editMode, $builder.editMode)
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
    
    @ViewBuilder
    func GameImageView(_ photosPickerItemBinding: Binding<PhotosPickerItem?>) -> some View {
        if self.isLibrary {
            Section {
                VStack(alignment: .center) {
                    ImageView()
                        .onTapGesture(count: 2, perform: {
                            if self.isEditing, let image: UIImage = UIPasteboard.general.images?.first {
                                self.setData(image.data, .paste)
                                self.resetPhotosPickerItem()
                            }
                        })
                    if self.isEditing {
                        HStack {
                            PhotosPicker(selection: photosPickerItemBinding, matching: .images, photoLibrary: .shared()) {
                                ConstantsText(self.isBoxartEmpty ? .add : .edit).bold()
                            }
                            .onChange(of: self.photosPickerItem, { old, new in
                                if self.imagePicker == .paste {
                                    self.setPicker(.picker)
                                } else {
                                    Task {
                                        let data: Data? = try? await self.photosPickerItem?.loadTransferable(type: Data.self)
                                        self.setData(data, .picker)
                                    }
                                }
                            })
                            if !self.isBoxartEmpty {
                                Button(action: self.resetPhotosPickerItem, label: {
                                    ConstantsText(.delete).bold()
                                })
                            }
                        }
                        .buttonStyle(.borderless)
                    }
                }
            }
        }
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
                ConstantsText(.done)
            } else {
                ConstantsText(.edit)
            }
        })
        .disabled(self.isConfirmButtonDisabled)
    }
    
}
