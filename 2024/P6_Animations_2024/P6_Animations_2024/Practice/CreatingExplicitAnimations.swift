//
//  CreatingExplicitAnimations.swift
//  P6_Animations_2024
//
//  Created by  Ty Vaughan on 2/28/24.
//

import SwiftUI

struct CreatingExplicitAnimations: View {
    
    @State private var animationAmount = 0.0

    var body: some View {
        Button("Tap Me") {
            withAnimation(.spring(duration: 1, bounce: 0.5)) {
                animationAmount += 360
            }
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .rotation3DEffect(
            .degrees(animationAmount),
            axis: (x: -1, y: 1.0, z: 1)
        )
    }

}

#Preview {
    CreatingExplicitAnimations()
}
