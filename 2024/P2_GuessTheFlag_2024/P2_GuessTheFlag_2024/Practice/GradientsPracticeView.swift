//
//  GradientsPracticeView.swift
//  P2_GuessTheFlag_2024
//
//  Created by  Ty Vaughan on 2/19/24.
//

import SwiftUI

struct GradientsPracticeView: View {
    var body: some View {
        VStack {
            /*
             We can create gradients that transition between colors automatically
             */
            LinearGradient(colors: [.white, .black], startPoint: .top, endPoint: .bottom)
                .border(.blue)
            
            /*
             We can specify stops for how far a color should go in the gradient
             */
            LinearGradient(stops: [
                Gradient.Stop(color: .white, location: 0.45),
                Gradient.Stop(color: .black, location: 0.55)
            ], startPoint: .top, endPoint: .bottom)
            .border(.blue)
            
            /*
             Swift knows we're giving Gradient.Stop's, so we can use the init
             */
            LinearGradient(stops: [
                .init(color: .white, location: 0.45),
                .init(color: .black, location: 0.55)
            ], startPoint: .top, endPoint: .bottom)
            .border(.blue)
            
            /*
             We can create Radial gradients
             */
            RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20, endRadius: 200)
            
            /*
             We can create angular (conic) gradients
             */
            AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red], center: .center)
            
            /*
             Swift allows us to automatically apply gradients to foreground or background colors
             
             These gradients are extremely subtle.
             */
            Text("Your content")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundStyle(.white)
                .background(.red.gradient)
        }
    }
}

#Preview {
    GradientsPracticeView()
}
