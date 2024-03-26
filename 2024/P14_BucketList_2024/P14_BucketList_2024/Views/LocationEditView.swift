//
//  LocationEditView.swift
//  P14_BucketList_2024
//
//  Created by  Ty Vaughan on 3/24/24.
//

import SwiftUI

struct LocationEditView: View {
    @Environment(\.dismiss) var dismiss
    @State private var viewModel: ViewModel
    
    public var onSave: (Location) -> Void
        
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Place name", text: $viewModel.name)
                    TextField("Description", text: $viewModel.description)
                }
                
                Section("Nearby places") {
                    switch viewModel.loadingState {
                    case .loaded:
                        ForEach(viewModel.pages, id: \.pageid) { page in
                            Text(page.title)
                                .font(.headline) +
                            Text(": ") +
                            Text(page.description)
                                .italic()
                        }
                    case .loading:
                        Text("Loading...")
                    case .failed:
                        Text("Please try again later.")
                    }
                }
            }
            .navigationTitle("Place details")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        var newLocation = viewModel.location
                        newLocation.name = viewModel.name
                        newLocation.description = viewModel.description
                        onSave(newLocation)
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
            .task {
                await viewModel.getNearbyPlaces()
            }
        }
    }
    
    init(location: Location, onSave: @escaping (Location) -> Void) {
        _viewModel = State(initialValue: ViewModel(location: location))
        self.onSave = onSave
        
        // Set state using private variables to reference properties
//        _name = State(initialValue: location.name)
//        _description = State(initialValue: location.description)
    }

}

#Preview {
    LocationEditView(location: Location.example, onSave: { _ in } )
}
