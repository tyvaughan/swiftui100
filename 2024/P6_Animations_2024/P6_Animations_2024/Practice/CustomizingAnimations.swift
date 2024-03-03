//
//  CustomizingAnimations.swift
//  P6_Animations_2024
//
//  Created by  Ty Vaughan on 2/28/24.
//

import SwiftUI

struct CustomizingAnimations: View {

    @State private var animationAmount = 1.0
    
    /*
     The animation() modifier automatically animates any changes that happen to a View using whatever the default system animation is.
     
     We can provide the type of animation used if we want to customize the animation.
     */
    
    var body: some View {
        Spacer()

        Button("Tap me") {
            animationAmount = animationAmount == 1 ? 2 : 1
        }
        .padding(25)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .scaleEffect(animationAmount)
        .animation(.linear, value: animationAmount)

        Spacer()

        Button("Tap me") {
            animationAmount = animationAmount == 1 ? 2 : 1
        }
        .padding(25)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .scaleEffect(animationAmount)
        .animation(.spring(duration: 1, bounce: 0.75), value: animationAmount)

        Spacer()

        /*
         .easeInOut() creates an instance of an Animation struct, which has its own set of modifiers, such as .delay()
         */
        
        Button("Tap me") {
            animationAmount = animationAmount == 1 ? 2 : 1
        }
        .padding(25)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .scaleEffect(animationAmount)
        .animation(
            .easeInOut(duration: 2)
                .delay(1)
                .repeatCount(3, autoreverses: true),
            value: animationAmount
        )

        Spacer()
        
        Button("Tap me") {
            animationAmount = animationAmount == 1 ? 2 : 1
        }
        .padding(25)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .overlay(
            Circle()
                .stroke(.red)
                .scaleEffect(animationAmount)
                .opacity(2 - animationAmount)
                .animation(
                    .easeInOut(duration: 1)
                        .repeatForever(autoreverses: false),
                    value: animationAmount
                )
        )
        .onAppear {
            animationAmount = 2
        }

        Spacer()
    }
}

#Preview {
    CustomizingAnimations()
}
