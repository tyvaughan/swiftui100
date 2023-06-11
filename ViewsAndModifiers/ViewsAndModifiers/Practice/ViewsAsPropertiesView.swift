//
//  ViewsAsPropertiesView.swift
//  ViewsAndModifiers
//
//  Created by  Ty Vaughan on 6/3/23.
//

import SwiftUI

struct ViewsAsPropertiesView: View {
    // We can store Views as variables
    let motto1 = Text("Draco dormiens")
    let motto2 = Text("nunquam titillandus")

    // We can represent Views as computed properties
    var spells1: some View {
        VStack {
            Text("Lumos")
            Text("Obliviate")
        }
    }
    
    // We can send them back as a Group so the calling context determines layout
    var spells2: some View {
        Group {
            Text("Lumos")
            Text("Obliviate")
        }
    }
    
    // An alternative to returning them in a group, we can use @ViewBuilder
    @ViewBuilder var spells3: some View {
        Text("Lumos")
        Text("Obliviate")
    }
    
    var body: some View {
        VStack {
            motto1
                .foregroundColor(.red)
            motto2
                .foregroundColor(.blue)
        }
    }
}

struct ViewsAsPropertiesView_Previews: PreviewProvider {
    static var previews: some View {
        ViewsAsPropertiesView()
    }
}
