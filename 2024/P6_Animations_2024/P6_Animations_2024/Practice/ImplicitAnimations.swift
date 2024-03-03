//
//  ImplicitAnimations.swift
//  P6_Animations_2024
//
//  Created by  Ty Vaughan on 2/28/24.
//

import SwiftUI

struct ImplicitAnimations: View {
    
    @State private var animationAmount = 1.0
    
    /*
     We can add the .animation() modifier to create an implicit
     animation.
     
     The implicit animation will apply to all button modifiers BEFORE the implicit animation modifier that change when the binding's value changes.
     */
    
    var body: some View {
        Button("Tap me") {
            animationAmount = animationAmount == 1 ? 2 : 1
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .scaleEffect(animationAmount)
        .blur(radius: (animationAmount - 1) * 3)
        .animation(.default, value: animationAmount)
    }
}

#Preview {
    ImplicitAnimations()
}
