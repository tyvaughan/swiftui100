//
//  TwoSideBySideViews.swift
//  P19_SnowSeeker_2024
//
//  Created by  Ty Vaughan on 4/18/24.
//

import SwiftUI

struct TwoSideBySideViews: View {
    var body: some View {
        

        
        TabView {
            
            /*
             On iPhone, you'll see the primary view.
             On iPad landscape, you'll see primary in a sidebar, and content filling the rest.
             On iPad portrait, you'll see content filling the screen.
             On iPad multitasking, you'll see primary gets hidden.
             On MacOS, you'll see primary in a sidebar, and content filling the rest.
             */

            NavigationSplitView {
                Text("Primary")
            } detail: {
                Text("Content")
            }
            .tabItem {
                Label("First example", systemImage: "1.circle")
            }
            
            /*
             If we put a link in the split view, it will automatically navigate to that view in the "detail" portion of the NavigationSplitView.
             */
            
            NavigationSplitView {
                NavigationLink("Primary") {
                    Text("New View")
                }
            } detail: {
                Text("Contentt")
            }
            .tabItem {
                Label("Second example", systemImage: "2.circle")
            }
            
            /*
             columnVisibility takes a binding as a parameter, so we can programmatically open and close the column view.
             
             The navigationSplitViewStyle modifier allows us to determine the default column visibility.
             */
            
            NavigationSplitView(columnVisibility: .constant(.all)) {
                NavigationLink("Primary") {
                    Text("New View")
                }
            } detail: {
                Text("Contentt")
                    .navigationTitle("Content View")
            }
            .navigationSplitViewStyle(.balanced)
            .tabItem {
                Label("Third example", systemImage: "3.circle")
            }
            
            /*
             We can also specify which view (column or detail) is visible by default.
             */
            
            NavigationSplitView(preferredCompactColumn: .constant(.detail)) {
                NavigationLink("Primary") {
                    Text("New View")
                }
            } detail: {
                Text("Contentt")
                    .navigationTitle("Content View")
            }
            .navigationSplitViewStyle(.balanced)
            .tabItem {
                Label("Fourth example", systemImage: "4.circle")
            }
            
            /*
             We can have up to two sidebar layers for extra navigation.
             */
            
            NavigationSplitView(preferredCompactColumn: .constant(.detail)) {
                NavigationLink("Primary") {
                    Text("New View")
                }
            } content: {
                Text("Content")
                    .navigationTitle("Content View")
            } detail: {
                Text("Detail")
                    .navigationTitle("Detail View")
            }
            .navigationSplitViewStyle(.balanced)
            .tabItem {
                Label("Fifth example", systemImage: "5.circle")
            }
        }
    }
}

#Preview {
    TwoSideBySideViews()
}
