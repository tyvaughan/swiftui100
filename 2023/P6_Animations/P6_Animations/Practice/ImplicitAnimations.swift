//
//  ImplicitAnimations.swift
//  P6_Animations
//
//  Created by  Ty Vaughan on 6/11/23.
//

import SwiftUI

struct ImplicitAnimations: View {
    
    @State private var animationAmount = 1.0
    
    var body: some View {
        VStack {
            Button("Tap me") {
                animationAmount += 0.2
            }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
            .blur(radius: (animationAmount - 1) * 3)
            .animation(.default, value: animationAmount) // We can use implicit animation so that every time animationAmount changes, animation is applied to the Button; this will animate all properties of the view that change
        }
    }
}

struct ImplicitAnimations_Previews: PreviewProvider {
    static var previews: some View {
        ImplicitAnimations()
    }
}
