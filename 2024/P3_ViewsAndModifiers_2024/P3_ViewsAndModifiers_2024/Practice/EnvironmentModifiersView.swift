//
//  EnvironmentModifiersView.swift
//  P3_ViewsAndModifiers_2024
//
//  Created by  Ty Vaughan on 2/21/24.
//

import SwiftUI

struct EnvironmentModifiersView: View {
    var body: some View {
        /*
         Some modifiers when applied to a container will apply to all child views within that container.
         
         These modifiers are called environment modifiers. If a child view specifies the same modifier, the child's modifier takes priority.
         */
        
        // .font is an environment modifier -> applied to all children of the VStack
        VStack {
            Text("Gryffindor")
                .font(.largeTitle)
            Text("Hufflepuff")
            Text("Ravenclaw")
            Text("Slytherin")
        }
        .font(.title)
        
        // .blue is a regular modifier -> applied directly to the VStack
        VStack {
            Text("Gryffindor")
                .blur(radius: 0)
            Text("Hufflepuff")
            Text("Ravenclaw")
            Text("Slytherin")
        }
        .blur(radius: 5)
    }
}

#Preview {
    EnvironmentModifiersView()
}
