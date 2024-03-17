//
//  ContentView.swift
//  P11_Bookworm_2024
//
//  Created by  Ty Vaughan on 3/13/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {

    var body: some View {
        NavigationStack {
            HomeView()
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Book.self, configurations: config)

    return ContentView()
        .modelContainer(container)
}
