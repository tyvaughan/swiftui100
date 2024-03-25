//
//  LocationEditView.swift
//  P14_BucketList_2024
//
//  Created by  Ty Vaughan on 3/24/24.
//

import SwiftUI

struct LocationEditView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var name: String
    @State private var description: String
    
    public var location: Location
    public var onSave: (Location) -> Void
        
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Place name", text: $name)
                    TextField("Description", text: $description)
                }
            }
            .navigationTitle("Place details")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        var newLocation = location
                        newLocation.name = name
                        newLocation.description = description
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
        }
    }
    
    init(location: Location, onSave: @escaping (Location) -> Void) {
        self.location = location
        self.onSave = onSave
        _name = State(initialValue: location.name)
        _description = State(initialValue: location.description)
    }
}

#Preview {
    LocationEditView(location: Location.example, onSave: { _ in } )
}
