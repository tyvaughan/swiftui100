//
//  ContactDetailsView.swift
//  M5_RememberMe_2024
//
//  Created by  Ty Vaughan on 3/27/24.
//

import MapKit
import SwiftData
import SwiftUI

struct ContactDetailsView: View {
    
    @State var viewModel: ViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                ContactPhotoComponent(photo: viewModel.contact.displayPhoto, size: 200)
                Text(viewModel.contact.displayName)
                    .font(.title)
                Map(initialPosition: viewModel.startPosition)
                    .frame(height: 400)
            }
        }
    }
    
    // MARK: Initializers
    
    init(contact: Contact) {
        self.viewModel = ViewModel(contact: contact)
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Contact.self, configurations: config)

    return ContactDetailsView(contact: Contact.example)
        .modelContainer(container)
}
