//
//  DiceImage.swift
//  M6_DiceMaster_2024
//
//  Created by  Ty Vaughan on 4/12/24.
//

import SwiftUI

struct DiceImage: View {
    var die: Dice
    var value: String?

    var image: String {
        switch die.type {
        case .d4:
            "triangle.fill"
        case .d6:
            "square.fill"
        case .d8:
            "diamond.fill"
        case .d10:
            "pentagon.fill"
        case .d12:
            "octagon.fill"
        case .d20:
            "hexagon.fill"
        }
    }
    
    var body: some View {
        ZStack {
            Image(systemName: image)
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundStyle(Color(hex: die.dieColor))
                .shadow(radius: 4)
            Text(value ?? die.sides[die.sides.count - 1])
                .foregroundStyle(Color(hex: die.valueColor))
        }
    }

}

#Preview {
    DiceImage(die: Dice.example.d4)
}
