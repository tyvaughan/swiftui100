//
//  UserAccessibilitySettings.swift
//  P17_Flashzilla_2024
//
//  Created by  Ty Vaughan on 4/2/24.
//

import SwiftUI

/*
 We can create a wrapper for withAnimation to only enable the animation if reduce motion is not enabled
 */
func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
    if UIAccessibility.isReduceMotionEnabled {
        return try body()
    } else {
        return try withAnimation(animation, body)
    }
}

struct UserAccessibilitySettings: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    
    @State private var scale = 1.0
    
    var body: some View {
        VStack {
            HStack {
                if differentiateWithoutColor {
                    Image(systemName: "checkmark.circle")
                }
                Text("Success")
            }
            .padding()
            .background(differentiateWithoutColor ? .black : .green)
            .foregroundStyle(.white)
            .clipShape(.capsule)
            
            /*
             Without wrapper
             */
            Button("Hello, world!") {
                if reduceMotion {
                    scale *= 1.5
                } else {
                    withAnimation {
                        scale *= 1.5
                    }
                }
            }
            .scaleEffect(scale)
            
            /*
             With wrapper
             */
            Button("Hello, world!") {
                withOptionalAnimation {
                    scale *= 1.5
                }
            }
            .scaleEffect(scale)
            
            Text("Hello, world!")
                .padding()
                .background(reduceTransparency ? .black : .black.opacity(0.5))
                .foregroundStyle(.white)
                .clipShape(.capsule)
        }
    }
    
    
}

#Preview {
    UserAccessibilitySettings()
}
