//
//  AnimatingBindings.swift
//  P6_Animations_2024
//
//  Created by  Ty Vaughan on 2/28/24.
//

import SwiftUI

struct AnimatingBindings: View {
    
    @State private var animationAmount = 1.0
    
    /*
     The animation() modifier can be applied to any SwiftUI binding, which causes the value to animation between its current and new value.
     */

    var body: some View {
        
        print(animationAmount)
        
        return VStack {
            Stepper("Scale amount", value: $animationAmount.animation(), in: 1...10)
                        
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
            .foregroundStyle(.white)
            .clipShape(.circle)
            .scaleEffect(animationAmount)
        }
    }

}

#Preview {
    AnimatingBindings()
}
