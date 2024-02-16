//
//  ConditionalModifiersView.swift
//  P3_ViewsAndModifiers_2024
//
//  Created by  Ty Vaughan on 2/21/24.
//

import SwiftUI

struct ConditionalModifiersView: View {
    @State private var useRedText = false

    var body: some View {
        /*
         Using conditionals to change values in a modifier is more efficient because Swift can update the current view
         */
        Button("Hello World") {
            // flip the Boolean between true and false
            useRedText.toggle()
        }
        .foregroundStyle(useRedText ? .red : .blue)
        
        /*
         Using an if statement results in Swift needing to destroy and recreate the view, which is less efficient.
         */
        if useRedText {
            Button("Hello World") {
                useRedText.toggle()
            }
            .foregroundStyle(.red)
        } else {
            Button("Hello World") {
                useRedText.toggle()
            }
            .foregroundStyle(.blue)
        }
    }
}

#Preview {
    ConditionalModifiersView()
}
