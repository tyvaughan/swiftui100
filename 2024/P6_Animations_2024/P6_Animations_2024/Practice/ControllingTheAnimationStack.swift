//
//  ControllingTheAnimationStack.swift
//  P6_Animations_2024
//
//  Created by  Ty Vaughan on 2/28/24.
//

import SwiftUI

struct ControllingTheAnimationStack: View {
    
    @State private var enabled = false
    @State private var animationAmount = 1.0
    
    /*
     Each animation modifier only applies up to the previous modifier
     */
    
    var body: some View {
        Button("Tap me") {
            enabled.toggle()
            animationAmount = animationAmount == 1 ? 2 : 1
        }
        .padding(50)
        .background(enabled ? .blue : .red)
        .animation(nil, value: enabled) // we can pass nil to declare modifiers that we don't want animations applied to
        .foregroundStyle(.white)
        .animation(.default, value: enabled)
        .clipShape(.rect(cornerRadius: enabled ? 32 : 12))
        .animation(.spring(duration: 1, bounce: 0.5), value: enabled)
    }
}

#Preview {
    ControllingTheAnimationStack()
}
