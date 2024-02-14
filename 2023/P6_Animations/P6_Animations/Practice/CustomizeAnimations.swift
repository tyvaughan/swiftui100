//
//  CustomizingAnimations.swift
//  P6_Animations
//
//  Created by  Ty Vaughan on 6/11/23.
//

import SwiftUI

struct CustomizingAnimations: View {
    
    @State private var animationAmount1 = 1.0
    @State private var animationAmount2 = 1.0
    
    var body: some View {
        VStack(spacing: 50) {
            Button("Press me 1") {
                animationAmount1 += 0.2
            }
            .padding(20)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .scaleEffect(animationAmount1)
            // because the Animation value passed to the .animation modifier returns an Animation struct, we can attach modifiers to it, such as adding a delay
            .animation(
                .easeInOut(duration: 2)
                .repeatCount(3, autoreverses: true)
                .delay(1),
                value: animationAmount1
            )
            
            Button("Press me 2") {
//                animationAmount2 += 0.2
            }
            .padding(20)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.red)
                    .scaleEffect(animationAmount2)
                    .opacity(2 - animationAmount2)
                    .animation(
                        .easeOut(duration: 1)
                            .repeatForever(autoreverses: false),
                        value: animationAmount2
                    )
            )
            .onAppear {
                animationAmount2 = 1.5
            }
        }
    }
}

struct CustomizingAnimations_Previews: PreviewProvider {
    static var previews: some View {
        CustomizingAnimations()
    }
}
