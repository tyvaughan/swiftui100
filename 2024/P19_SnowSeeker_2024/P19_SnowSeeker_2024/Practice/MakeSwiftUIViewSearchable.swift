//
//  MakeSwiftUIViewSearchable.swift
//  P19_SnowSeeker_2024
//
//  Created by  Ty Vaughan on 4/18/24.
//

import SwiftUI

/*
 The searchable modifier allows us to add a search text field to the navigation view.
 */

struct MakeSwiftUIViewSearchable: View {
    @State private var searchText = ""
    let allNames = ["Subh", "Vina", "Melvin", "Stefanie"]
    
    var filteredNames: [String] {
        if searchText.isEmpty {
            allNames
        } else {
            allNames.filter { $0.localizedStandardContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationStack {
            List(filteredNames, id: \.self) { name in
                Text(name)
            }
                .searchable(text: $searchText, prompt: "Look for something")
                .navigationTitle("Searching")
        }
    }
}

#Preview {
    MakeSwiftUIViewSearchable()
}
