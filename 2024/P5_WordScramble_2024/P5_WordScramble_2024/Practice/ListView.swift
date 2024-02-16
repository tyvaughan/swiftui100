//
//  ListView.swift
//  P5_WordScramble_2024
//
//  Created by  Ty Vaughan on 2/25/24.
//

/*
 List View
 - the equivalent of UIKit's UITableView

 */

import SwiftUI

struct ListView: View {
    var body: some View {
        /*
         We can provide rows manually to a List
         */
        List {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Text("Hello, World!")
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        
        /*
         We can also use ForEach to create dynamic rows
         */
        List {
            ForEach(0..<5) {
                Text("Dynamic row \($0)")
            }
        }
        
        /*
         We can also mix static and dynamic list rows
         */
        List {
            Section("Section 1") {
                Text("Static row 1")
            }
            Section("Section 2") {
                ForEach(0..<2, id: \.self) {
                    Text("Dynamic row \($0)")
                }
            }
            Section("Section 3") {
                Text("Static row 2")
            }
        }
        .listStyle(.grouped)
        
        /*
         Unlike Forms, Lists can create dynamic content without a ForEach view
         */
        List(0..<5, id: \.self) {
            Text("Dynamic row \($0)")
        }
    }
}

#Preview {
    ListView()
}
