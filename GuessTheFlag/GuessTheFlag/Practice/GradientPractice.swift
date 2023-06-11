//
//  GradientPractice.swift
//  GuessTheFlag
//
//  Created by  Ty Vaughan on 5/31/23.
//

import SwiftUI

struct GradientPractice: View {
    var body: some View {
        VStack {
            LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
                .frame(width: .infinity, height: 50)
            
            LinearGradient(gradient: Gradient(stops: [
                Gradient.Stop(color: .white, location: 0.45),
                Gradient.Stop(color: .black, location: 0.55)
            ]), startPoint: .top, endPoint: .bottom)
            .frame(width: .infinity, height: 50)
            
            RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)
                .frame(width: .infinity, height: 50)
            
            AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
                .frame(width: .infinity, height: 50)
        }
    }
}

struct GradientPractice_Previews: PreviewProvider {
    static var previews: some View {
        GradientPractice()
    }
}
