//
//  ContactsListView.swift
//  M5_RememberMe_2024
//
//  Created by  Ty Vaughan on 3/27/24.
//

import SwiftData
import SwiftUI

struct ContactsListView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: [
        SortDescriptor(\Contact.name)
    ]) var contacts: [Contact]
    
    @State private var viewModel: ViewModel
    
    var body: some View {
        ContactsListComponent(contacts: contacts)
            .navigationTitle("Contacts")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    NavigationLink("Add") {
                        AddContactView()
                    }
                }
            }
    }
    
    init() {
        self.viewModel = ViewModel()
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Contact.self, configurations: config)

    return NavigationStack {
        ContactsListView()
            .modelContainer(container)
    }
}
