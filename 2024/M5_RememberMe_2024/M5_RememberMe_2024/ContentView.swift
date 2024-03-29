//
//  ContentView.swift
//  M5_RememberMe_2024
//
//  Created by  Ty Vaughan on 3/27/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @State var path: NavigationPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            ContactsListView()
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Contact.self, configurations: config)

    return ContentView()
        .modelContainer(container)
}
