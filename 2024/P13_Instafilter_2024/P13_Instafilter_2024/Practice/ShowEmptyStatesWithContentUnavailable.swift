//
//  ShowEmptyStatesWithContentUnavailable.swift
//  P13_Instafilter_2024
//
//  Created by  Ty Vaughan on 3/19/24.
//

import SwiftUI

/*
 ContentUnavailableView is used when there is not yet any data to present.
 
 This could be when there aren't any search results, or the user hasn't provided inputs yet.
 */

struct ShowEmptyStatesWithContentUnavailable: View {
    var body: some View {
        // We can provide simple values for properties
        ContentUnavailableView(
            "No snippets",
            systemImage: "swift",
            description: Text("You don't have any saved snipped yets.")
        )
        
        // We can take full control over the UI
        ContentUnavailableView {
            Label("No snippets", systemImage: "swift")
        } description: {
            Text("You don't have any saved snippets yet.")
        } actions: {
            Button("Create snippet") {
                // create a snippet
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    ShowEmptyStatesWithContentUnavailable()
}
