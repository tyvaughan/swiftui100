//
//  P12_SwiftDataTechnique_2024App.swift
//  P12_SwiftDataTechnique_2024
//
//  Created by  Ty Vaughan on 3/16/24.
//

import SwiftData
import SwiftUI

@main
struct P12_SwiftDataTechnique_2024App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
        .modelContainer(for: Job.self)
    }
}
