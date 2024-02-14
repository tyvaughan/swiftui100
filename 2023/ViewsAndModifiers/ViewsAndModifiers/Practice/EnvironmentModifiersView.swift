//
//  EnvironmentModifiersView.swift
//  ViewsAndModifiers
//
//  Created by  Ty Vaughan on 6/3/23.
//

import SwiftUI

struct EnvironmentModifiersView: View {
    var body: some View {
        /*
         Some modifiers apply to containers, and thus are applied to each child View.
         These modifiers are called Environment Modifiers.
         
         If any child View has a modifier that overrides an Environment Modifier,
         the child View's modifier takes precedence
         */
        VStack {
            Text("Gryffindor")
                .font(.largeTitle)
            Text("Hufflepuff")
            Text("Ravenclaw")
            Text("Slytherin")
        }
        .font(.title)
    }
}

struct EnvironmentModifiersView_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentModifiersView()
    }
}
