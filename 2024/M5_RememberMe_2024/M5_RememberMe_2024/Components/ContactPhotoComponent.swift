//
//  ContactPhotoComponent.swift
//  M5_RememberMe_2024
//
//  Created by  Ty Vaughan on 3/29/24.
//

import SwiftData
import SwiftUI

struct ContactPhotoComponent: View {
    var photo: UIImage?
    var size: Double = 60
    
    var body: some View {
        if let photo = photo {
            Image(uiImage: photo)
                .resizable()
                .frame(width: size, height: size)
                .scaledToFit()
                .cornerRadius(size / 2)
        } else {
            ZStack {
                Circle()
                    .foregroundColor(.gray)
                    .frame(width: size, height: size)
                Image(systemName: "person")
                    .resizable()
                    .frame(width: size / 2, height: size / 2)
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Contact.self, configurations: config)

    return ContactPhotoComponent(photo: Contact.example.displayPhoto)
        .modelContainer(container)
}
