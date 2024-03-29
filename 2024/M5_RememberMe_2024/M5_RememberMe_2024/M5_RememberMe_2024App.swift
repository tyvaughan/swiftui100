//
//  M5_RememberMe_2024App.swift
//  M5_RememberMe_2024
//
//  Created by  Ty Vaughan on 3/27/24.
//

import SwiftData
import SwiftUI

@main
struct M5_RememberMe_2024App: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Contact.self)
    }

}
