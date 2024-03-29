//
//  AddContactView+ViewModel.swift
//  M5_RememberMe_2024
//
//  Created by  Ty Vaughan on 3/29/24.
//

import Foundation
import PhotosUI
import SwiftUI

extension AddContactView {
    
    @Observable
    class ViewModel {
        
        public var name: String
        public var photo: Data?
        public var selectedPhotoItem: PhotosPickerItem?
        
        var displayPhoto: UIImage? {
            guard let photoData = photo else { return nil }
            guard let uiImage = UIImage(data: photoData) else { return nil }
            return uiImage
        }
        
        // MARK: Initializers
        
        init() {
            self.name = ""
            self.photo = nil
        }
        
        // MARK: Helper methods
        
        func loadPhotoData() -> Void {
            Task {
                if let data = try? await selectedPhotoItem?.loadTransferable(type: Data.self) {
                    photo = data
                }
            }
        }
        
    }
    
}
