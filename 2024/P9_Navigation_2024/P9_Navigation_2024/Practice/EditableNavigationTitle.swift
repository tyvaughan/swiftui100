//
//  EditableNavigationTitle.swift
//  P9_Navigation_2024
//
//  Created by  Ty Vaughan on 3/6/24.
//

import SwiftUI

struct EditableNavigationTitle: View {
    @State private var title = "SwiftUI"

    var body: some View {
        NavigationStack {
            Text("Hello, world!")
                .navigationTitle($title)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    EditableNavigationTitle()
}
