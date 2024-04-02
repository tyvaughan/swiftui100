//
//  CreatingTabs.swift
//  P16_HotProspects_2024
//
//  Created by  Ty Vaughan on 4/1/24.
//

import SwiftUI

/*
 Navigation stacks are great for navigating through a hierarchy of related views.
 
 Tabs are great for navigating through view with unrelated information or different categories of information.
 */

/*
We can programmatically swap between tabs and track which tab we're on by associating an ID to each tab, and storing that ID in state.
 */


struct CreatingTabs: View {
    @State private var selectedTab = "One"
    
    var body: some View {
        TabView(selection: $selectedTab) {
            /*
             In a TabView, add the view you wish to navigate too, then add the tabItem modifier to specify the tab UI
             */
            VStack {
                Text("Tab 1")
                Button("Show tab 2") {
                    selectedTab = "Two" // update the ID for the tab
                }
            }
                .tabItem {
                    Label("Hi", systemImage: "star")
                }
                .tag("One")
            
            VStack {
                Text("Tab 2")
                Button("Show tab 1") {
                    selectedTab = "One"
                }
            }
                .tabItem {
                    Label("Hi", systemImage: "circle")
                }
                .tag("Two")
        }
    }
}

#Preview {
    CreatingTabs()
}
