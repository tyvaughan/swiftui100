//
//  ScrollingGrid.swift
//  P8_Moonshot_2024
//
//  Created by  Ty Vaughan on 3/4/24.
//

import SwiftUI

struct ScrollingGrid: View {
    
    let layout = [
        GridItem(.adaptive(minimum: 80, maximum: 120)),
        GridItem(.adaptive(minimum: 80, maximum: 120)),
        GridItem(.adaptive(minimum: 80, maximum: 120))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: layout) {
                ForEach(0..<100) {
                    Text("Item \($0)")
                }
            }
        }
        ScrollView(.horizontal) {
            LazyHGrid(rows: layout) {
                ForEach(0..<100) {
                    Text("Item \($0)")
                }
            }
        }
    }
}

#Preview {
    ScrollingGrid()
}
