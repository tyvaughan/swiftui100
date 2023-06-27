//
//  AnimationStack.swift
//  P6_Animations
//
//  Created by  Ty Vaughan on 6/15/23.
//

import SwiftUI

struct AnimationStack: View {
    
    @State private var enabled = false
    
    /*
     You can use multiple .animation modifiers to apply animations differently.
     
     Each animation modifier only applies to property changes from the last animation
     modifer up to itself.
     
     You can pass in nil as the Animation value to the .animation modifier to disable
     the animation.
     */
    
    var body: some View {
        Button("Tap me") {
            enabled.toggle()
        }
        .frame(width: 100, height: 100)
        .background(enabled ? .blue : .gray)
        .foregroundColor(.white)
        .animation(.default, value: enabled)
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 20 : 0))
        .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: enabled)
    }
}

struct AnimationStack_Previews: PreviewProvider {
    static var previews: some View {
        AnimationStack()
    }
}
