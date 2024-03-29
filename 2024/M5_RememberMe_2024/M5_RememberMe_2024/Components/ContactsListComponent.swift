//
//  ContactsListComponent.swift
//  M5_RememberMe_2024
//
//  Created by  Ty Vaughan on 3/27/24.
//

import SwiftData
import SwiftUI

struct ContactsListComponent: View {
    @Environment(\.modelContext) var modelContext

    var contacts: [Contact]
    
    var body: some View {
        List {
            ForEach(contacts) { contact in
                NavigationLink {
                    ContactDetailsView(contact: contact)
                } label: {
                    ContactListItemComponent(contact: contact)
                }
            }
            .onDelete(perform: removeContact)
        }
        .listStyle(.plain)
        .listSectionSeparator(.hidden)
    }
    
    // MARK: SwiftData methods
    
    func removeContact(at offsets: IndexSet) -> Void {
        for offset in offsets {
            // find contact in our list
            let contact = contacts[offset]
            
            // delete it from the context
            modelContext.delete(contact)
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Contact.self, configurations: config)

    return NavigationStack {
        ContactsListComponent(contacts: [
            Contact.example,
            Contact(
                name: "Charles",
                photo: UIImage(named: "aldrin")!.pngData()!,
                latitude: 33.7488,
                longitude: -84.3877
            )
        ])
        .modelContainer(container)
    }
}
