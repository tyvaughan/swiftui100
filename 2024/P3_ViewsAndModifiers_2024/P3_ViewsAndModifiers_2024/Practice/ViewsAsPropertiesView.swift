//
//  ViewsAsPropertiesView.swift
//  P3_ViewsAndModifiers_2024
//
//  Created by  Ty Vaughan on 2/21/24.
//

import SwiftUI

struct ViewsAsPropertiesView: View {
    let motto1 = Text("Draco dormiens")
    let motto2 = Text("nunquam titillandus")
    
    var body: some View {
        VStack {
            motto1
                .foregroundStyle(.red)
            motto2
                .foregroundStyle(.blue)
            spells
            spells2
        }
    }
    
    /*
     We can carve complex views into chunks by declaring views as additional computed properties similar to the body property.
     
     The Group view groups views together, and will take on any environmental modifiers that its surrounding stack has.
     */
    var spells: some View {
        Group {
            Text("Lumos")
            Text("Obliviate")
        }
    }
    
    /*
     We can also create a view that automatically groups views using ViewBuilder
     */
    @ViewBuilder var spells2: some View {
        Text("Lumos")
        Text("Obliviate")
    }

}

#Preview {
    ViewsAsPropertiesView()
}
