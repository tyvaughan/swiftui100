//
//  CustomRowSwipeOptions.swift
//  P16_HotProspects_2024
//
//  Created by  Ty Vaughan on 4/1/24.
//

import SwiftUI

/*
 We can add swipe actions to a list row to add additional actions a user can perform for items in a list.
 It is important to remember that swipe actions are hidden by default. So it's important that we don't hide important functionality in them, and should rely on using actions that are intuitive to the user.
 
 These options can be added to a View in a List via the .swipeActions modifier.
 */

struct CustomRowSwipeOptions: View {

    var body: some View {
        List {
            Text("Taylor Swift")
                .swipeActions {
                    Button("Send message", systemImage: "message") {
                        print("Hi")
                    }
                }
                .swipeActions(edge: .leading) {
                    Button("Pin", systemImage: "pin") {
                        print("Pinning")
                    }
                    .tint(.orange)
                }
        }
    }
}

#Preview {
    CustomRowSwipeOptions()
}
