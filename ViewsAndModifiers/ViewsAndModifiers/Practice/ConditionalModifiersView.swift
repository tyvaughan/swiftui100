//
//  ConditionalModifiersView.swift
//  ViewsAndModifiers
//
//  Created by  Ty Vaughan on 6/3/23.
//

import SwiftUI

struct ConditionalModifiersView: View {
    
    @State private var useRedText: Bool = false
    
    var body: some View {
        Button("Hello World") {
            useRedText.toggle()
        }
        .foregroundColor(useRedText ? .red : .blue
        )
    }
}

struct ConditionalModifiersView_Previews: PreviewProvider {
    static var previews: some View {
        ConditionalModifiersView()
    }
}
