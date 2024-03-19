//
//  LoadingPhotosFromPhotoLibrary.swift
//  P13_Instafilter_2024
//
//  Created by  Ty Vaughan on 3/19/24.
//

import PhotosUI
import SwiftUI

struct LoadingPhotosFromPhotoLibrary: View {
    
    /*
     To select photos, we need two properties.
     We need PhotosPickerItem to store the selection the user made.
     We need Image to store that selected item as an Image
     */
    @State private var pickerItem: PhotosPickerItem?
    @State private var selectedImage: Image?
    
    /*
     We can also select a range of photos
     */
    @State private var pickerItems = [PhotosPickerItem]()
    @State private var selectedImages = [Image]()
    
    var body: some View {
        VStack {
            VStack {
                selectedImage?
                    .resizable()
                    .frame(width: 200, height: 150)
                    .scaledToFit()
                PhotosPicker("Select a picture", selection: $pickerItem, matching: .images)
            }
            .onChange(of: pickerItem) {
                Task {
                    selectedImage = try await pickerItem?.loadTransferable(type: Image.self)
                }
            }
            
            Spacer()
            
            VStack {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(0..<selectedImages.count, id: \.self) { i in
                            selectedImages[i]
                                .resizable()
                                .frame(width: 200, height: 150)
                                .scaledToFit()
                        }
                    }
                }
                PhotosPicker(selection: $pickerItems, maxSelectionCount: 3, matching: .any(of: [.images, .not(.screenshots)])) {
                    Label("Select a picture", systemImage: "photo")
                }
            }
            .onChange(of: pickerItems) {
                Task {
                    selectedImages.removeAll()
                    for item in pickerItems {
                        if let loadedImage = try await item.loadTransferable(type: Image.self) {
                            selectedImages.append(loadedImage)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    LoadingPhotosFromPhotoLibrary()
}
