//
//  ModifierOrderView.swift
//  P3_ViewsAndModifiers_2024
//
//  Created by  Ty Vaughan on 2/21/24.
//

import SwiftUI

struct ModifierOrderView: View {
    var body: some View {
        Button("Hello, world!") {
            print(type(of: self.body))
        }
        .padding()
        .background(.red)
        .padding()
        .background(.blue)
        .padding()
        .background(.green)
        .padding()
        .background(.yellow)
    }
}

#Preview {
    ModifierOrderView()
}
