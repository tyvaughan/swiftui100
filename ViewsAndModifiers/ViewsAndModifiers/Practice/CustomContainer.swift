//
//  CustomContainer.swift
//  ViewsAndModifiers
//
//  Created by  Ty Vaughan on 6/3/23.
//

import Foundation
import SwiftUI

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    @ViewBuilder let content: (Int, Int) -> Content
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(0..<rows, id: \.self) { row in
                HStack(spacing: 20) {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
}
