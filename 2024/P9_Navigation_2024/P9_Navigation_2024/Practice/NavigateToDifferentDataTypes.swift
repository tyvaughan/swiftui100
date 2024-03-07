//
//  NavigateToDifferentDataTypes.swift
//  P9_Navigation_2024
//
//  Created by  Ty Vaughan on 3/6/24.
//

import SwiftUI

/*
 In cases where the path may contain data of different types, we can use a special type for the path variable - NavigationPath
 
 NavigationPath uses type-erasure
 */

struct NavigateToDifferentDataTypes: View {
    
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(0..<5) { i in
                    NavigationLink("Select number: \(i)", value: i)
                }
                ForEach(0..<5) { i in
                    NavigationLink("Select string: \(i)", value: String(i))
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected the number \(selection)")
            }
            .navigationDestination(for: String.self) { selection in
                Text("You selected the string \(selection)")
            }
            .toolbar {
                Button("Push 556") {
                    path.append(556)
                }
                Button("Push Hello") {
                    path.append("Hello")
                }
            }
        }
    }
}

#Preview {
    NavigateToDifferentDataTypes()
}
