//
//  ProgrammaticNavigation.swift
//  P9_Navigation_2024
//
//  Created by  Ty Vaughan on 3/6/24.
//

import SwiftUI

/*
 By providing a path, any time the path is modified, SwiftUI will automatically update the navigation stack to include all items in the path.
 This can be used to add new views, or remove views from the stack.
 */

struct ProgrammaticNavigation: View {
    @State private var path = [Int]()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Button("Show 32") {
                    path = [32, 42, 52]
                }
                Button("Show 64") {
                    path.append(64)
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected \(selection)")
            }
        }
    }
}

#Preview {
    ProgrammaticNavigation()
}
