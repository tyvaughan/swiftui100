//
//  PlacingToolbarButtons.swift
//  P9_Navigation_2024
//
//  Created by  Ty Vaughan on 3/6/24.
//

import SwiftUI

struct PlacingToolbarButtons: View {
    var body: some View {
        NavigationStack {
            Text("Hello, world")
                .toolbar {
                    // We can place individual items
                    ToolbarItem(placement: .navigation) {
                        Button("Tap me") {
                            
                        }
                    }
                    ToolbarItem(placement: .navigation) {
                        Button("Tap me") {
                            
                        }
                    }
                    
                    // We can use a group
                    ToolbarItemGroup(placement: .confirmationAction) {
                        Button("Tap me", action: { return })
                        Button("Tap me", action: { return })
                    }
                }
                .navigationBarBackButtonHidden() // hides back button in case the user needs to make a choice
                .toolbarColorScheme(.dark, for: .tabBar)
        }
    }
}

#Preview {
    PlacingToolbarButtons()
}
