//
//  ContactListItem.swift
//  M5_RememberMe_2024
//
//  Created by  Ty Vaughan on 3/27/24.
//

import SwiftData
import SwiftUI

struct ContactListItemComponent: View {
    var contact: Contact
    
    var body: some View {
        HStack {
            ContactPhotoComponent(photo: contact.displayPhoto, size: 60)
            Text("\(contact.name!)")
        }
        .accessibilityElement()
        .accessibilityLabel("\(contact.displayName)")
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Contact.self, configurations: config)

    return NavigationStack {
        ContactListItemComponent(contact: Contact.example)
            .modelContainer(container)
    }
}
