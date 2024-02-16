//
//  FlagView.swift
//  P2_GuessTheFlag_2024
//
//  Created by  Ty Vaughan on 2/19/24.
//

import SwiftUI

struct FlagView: View {
    
    @Binding public var countries: [String]

    @State public var number: Int
    @State public var handler: (_ number: Int) -> Void
    
    var body: some View {
        Button {
            handler(number)
        } label: {
            Image(countries[number])
                .clipShape(.rect(cornerRadius: 16))
                .shadow(radius: 16)
        }
    }
}

#Preview {
    FlagView(
        countries: .constant(K.countries),
        number: 0,
        handler: { (number: Int) in return }
    )
}
