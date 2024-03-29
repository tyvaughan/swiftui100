//
//  AddContactView.swift
//  M5_RememberMe_2024
//
//  Created by  Ty Vaughan on 3/27/24.
//

import PhotosUI
import SwiftData
import SwiftUI

struct AddContactView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    @State private var viewModel: ViewModel
    @StateObject var locationManager = LocationManager()
        
    var body: some View {
        Form {
            // photo picker
            VStack {
                PhotosPicker(selection: $viewModel.selectedPhotoItem) {
                    if viewModel.photo != nil {
                        HStack {
                            Spacer()
                            ContactPhotoComponent(photo: viewModel.displayPhoto, size: 200)
                            Spacer()
                        }
                    } else {
                        ContentUnavailableView("No picture selected", systemImage: "photo.badge.plus", description: Text("Tap to add a photo"))
                    }
                }
                .onChange(of: viewModel.selectedPhotoItem, viewModel.loadPhotoData)
            }
            
            TextField("Name", text: $viewModel.name, prompt: Text("Enter name..."))
        }
        .navigationTitle("New contact")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    addContact()
                    dismiss()
                }
            }
        }
    }
    
    // MARK: Initializers
    
    init() {
        self.viewModel = ViewModel()
    }
    
    // MARK: SwiftData methods
    
    public func addContact() -> Void {
        locationManager.start()
        let loc = locationManager.location
        print(loc)
        
        // Create new contact
        let newContact = Contact(
            name: viewModel.name,
            photo: viewModel.photo,
            latitude: loc?.latitude,
            longitude: loc?.longitude
        )

        // Save new contact
        modelContext.insert(newContact)
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Contact.self, configurations: config)

    return NavigationStack {
        AddContactView()
            .modelContainer(container)
    }
}
