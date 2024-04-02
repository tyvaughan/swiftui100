//
//  P16_HotProspects_2024App.swift
//  P16_HotProspects_2024
//
//  Created by  Ty Vaughan on 4/1/24.
//

import SwiftData
import SwiftUI

@main
struct P16_HotProspects_2024App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Prospect.self)
    }
}
