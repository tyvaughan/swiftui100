//
//  ContentView.swift
//  M3_HabitTracker_2024
//
//  Created by  Ty Vaughan on 3/7/24.
//

import SwiftUI

struct ContentView: View {
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack {
            HomeView(path: path)
        }
    }
}

#Preview {
    ContentView()
}
