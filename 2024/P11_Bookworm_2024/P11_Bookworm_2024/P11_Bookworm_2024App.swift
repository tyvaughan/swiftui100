//
//  P11_Bookworm_2024App.swift
//  P11_Bookworm_2024
//
//  Created by  Ty Vaughan on 3/13/24.
//

import SwiftData
import SwiftUI

@main
struct P11_Bookworm_2024App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
