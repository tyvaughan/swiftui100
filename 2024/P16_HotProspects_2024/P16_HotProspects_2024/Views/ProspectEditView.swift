//
//  ProspectEditView.swift
//  P16_HotProspects_2024
//
//  Created by  Ty Vaughan on 4/1/24.
//

import SwiftUI

struct ProspectEditView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    @State private var name: String
    @State private var email: String
    
    var prospect: Prospect
    
    var body: some View {
        Form {
            TextField("Name", text: $name)
            TextField("Email", text: $email)
        }
        .navigationTitle("Edit contact")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    onSave()
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
    
    init(prospect: Prospect) {
        self.prospect = prospect
        name = self.prospect.name
        email = self.prospect.emailAddress
    }
    
    func onSave() -> Void {
        prospect.name = name
        prospect.emailAddress = email
    }
}

#Preview {
    NavigationStack {
        ProspectEditView(prospect: Prospect.example)
            .modelContainer(for: Prospect.self)
    }
}
