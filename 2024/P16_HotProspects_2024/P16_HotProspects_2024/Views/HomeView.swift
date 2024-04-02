//
//  HomeView.swift
//  P16_HotProspects_2024
//56 
//  Created by  Ty Vaughan on 4/1/24.
//

import SwiftData
import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            ProspectsView(filter: .none)
                .tabItem {
                    Label("Everyone", systemImage: "person.3")
                }
            ProspectsView(filter: .contacted)
                .tabItem {
                    Label("Contacted", systemImage: "checkmark.circle")
                }
            ProspectsView(filter: .uncontacted)
                .tabItem {
                    Label("Uncontacted", systemImage: "questionmark.diamond")
                }
            MeView()
                .tabItem {
                    Label("Me", systemImage: "person.crop.square")
                }
        }
    }
}

#Preview {
    HomeView()
        .modelContainer(for: Prospect.self)
}
