//
//  CreatingContextMenus.swift
//  P16_HotProspects_2024
//
//  Created by  Ty Vaughan on 4/1/24.
//

import SwiftUI

/*
 Context menus are hidden, so be careful when using them, and make sure the user knows to use them. If they are used, they should be used often and in a uniform way so that users learn the interaction.
 
 iOS limits the customization of context menus to maintain the consistency of iOS's UI/UX. We can add some styling to context menus by specifying the role for buttons, such as red for destructive actions.
 */

struct CreatingContextMenus: View {
    @State private var backgroundColor = Color.red
    
    var body: some View {
        VStack {
            Text("Hello, World")
                .padding()
                .background(backgroundColor)
            Text("Change color")
                .padding()
                .contextMenu {
                    Button("Red", systemImage: backgroundColor == .red ? "checkmark.circle.fill" : "circle", role: .destructive) {
                        backgroundColor = .red
                    }
                    Button("Green", systemImage: backgroundColor == .green ? "checkmark.circle.fill" : "circle") {
                        backgroundColor = .green
                    }
                    Button("Blue", systemImage: backgroundColor == .blue ? "checkmark.circle.fill" : "circle") {
                        backgroundColor = .blue
                    }
                }
        }
    }
}

#Preview {
    CreatingContextMenus()
}
