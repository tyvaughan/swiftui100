//
//  AnimatingBindings.swift
//  P6_Animations
//
//  Created by  Ty Vaughan on 6/11/23.
//

import SwiftUI

/*
    The animation modifier can be applied to any SwiftUI binding.
 */

struct AnimatingBindings: View {
    
    @State private var animationAmount = 1.0
    
    var body: some View {
        print(animationAmount)
        
        return VStack {
            // We can apply the same animation modifiers to a binding as we can to a View
            Stepper("Scale amount", value: $animationAmount.animation(
                .easeInOut(duration: 1)
                .repeatCount(3, autoreverses: true)
            ), in: 1...10)
            
            Spacer()
            
            Button("Tap Me") {
                animationAmount += 1
            }
            .padding(40)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
        }
    }
}

struct AnimatingBindings_Previews: PreviewProvider {
    static var previews: some View {
        AnimatingBindings()
    }
}
