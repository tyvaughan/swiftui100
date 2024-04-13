//
//  HomeView.swift
//  M6_DiceMaster_2024
//
//  Created by  Ty Vaughan on 4/4/24.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedTab = 1
    
    var body: some View {
        TabView(selection: $selectedTab) {
            
            DiceEditView(die: Dice.example.d6)
                .tabItem {
                    Label("Edit Dice", systemImage: "1.circle")
                }
                .tag(1)
            
        }
    }
}

#Preview {
    HomeView()
}
