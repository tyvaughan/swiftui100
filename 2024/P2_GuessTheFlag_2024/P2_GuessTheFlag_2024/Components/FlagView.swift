//
//  FlagView.swift
//  P2_GuessTheFlag_2024
//
//  Created by  Ty Vaughan on 2/19/24.
//

import SwiftUI

struct FlagView: View {
    
    @Binding public var countries: [String]
    @Binding public var selectedAnswer: Int?

    @State public var number: Int
    @State public var handler: (_ number: Int) -> Void
    
    @State public var isAnswer = false
    @State private var opacityAmount = 1.0
    @State private var spinAmount = 0.0
        
    var body: some View {
        Button {
            handler(number)
        } label: {
            Image(countries[number])
                .clipShape(.rect(cornerRadius: 16))
                .shadow(radius: 16)
        }
        .opacity(selectedAnswer == nil || selectedAnswer == number ? 1.0 : 0.5)
        .rotation3DEffect(
            selectedAnswer == nil || selectedAnswer != number  ? .degrees(0) : .degrees(360),
            axis: (x: 0, y: 1.0, z: 0)
        )
        .scaleEffect(selectedAnswer == nil || selectedAnswer == number ? 1.0 : 0.75)
        .animation(.default, value: selectedAnswer)
    }

}

#Preview {
    FlagView(
        countries: .constant(K.countries),
        selectedAnswer: .constant(nil),
        number: 0,
        handler: { (number: Int) in return },
        isAnswer: true
    )
}
