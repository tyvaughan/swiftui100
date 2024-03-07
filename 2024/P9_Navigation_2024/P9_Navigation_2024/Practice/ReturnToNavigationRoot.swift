//
//  ReturnToNavigationRoot.swift
//  P9_Navigation_2024
//
//  Created by  Ty Vaughan on 3/6/24.
//

import SwiftUI

struct ReturnToNavigationRoot: View {
    @State private var path = [Int]()
    
    var body: some View {
        NavigationStack(path: $path) {
            DetailView(number: 0, path: $path)
                .navigationDestination(for: Int.self) { i in
                    DetailView(number: i, path: $path)
                }
        }
    }
    
    struct DetailView: View {
        var number: Int
        
        @Binding public var path: [Int]
        
        var body: some View {
            NavigationLink("Go to random number", value: Int.random(in: 1...1000))
                .navigationTitle("Number: \(number)")
                .toolbar {
                    Button("Home") {
                        path.removeAll()
                    }
                }
        }
    }
}

#Preview {
    ReturnToNavigationRoot()
}
