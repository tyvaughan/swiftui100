//
//  NavigationLinkViews.swift
//  P8_Moonshot_2024
//
//  Created by  Ty Vaughan on 3/4/24.
//

import SwiftUI

struct NavigationLinkViews: View {
    var body: some View {
        NavigationStack {
            NavigationLink {
                Text("Detail View")
            } label: {
                VStack {
                    Text("This is the label")
                    Text("So is this")
                    Image(systemName: "face.smiling")
                }
            }
            .navigationTitle("SwiftUI")
            
            List(0..<100) { row in
                NavigationLink("Row \(row)") {
                    Text("Detail \(row)")
                }
            }
        }
    }
}

#Preview {
    NavigationLinkViews()
}
