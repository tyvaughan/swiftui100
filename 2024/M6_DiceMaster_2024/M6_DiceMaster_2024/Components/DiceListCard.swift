//
//  DiceListCard.swift
//  M6_DiceMaster_2024
//
//  Created by  Ty Vaughan on 4/5/24.
//

import SwiftUI

struct DiceListCard: View {
    public var die: Dice
    public var onEdit: (() -> Void)?
    
    var body: some View {
        VStack {
            HStack {
                DiceImage(die: die)
                    .padding(.trailing, 10)
                Text(die.name)
                    .font(.system(size: 18))
                Spacer()
                if let onEdit = onEdit {
                    Button("Edit") {
                        onEdit()
                    }.buttonStyle(BorderlessButtonStyle())
                }
            }
        }
        .padding(10)
        .frame(maxWidth: .infinity)
        .background(.white)
        .cornerRadius(8)
        .shadow(radius: 4)
    }
    
    init(die: Dice) {
        self.die = die
        self.onEdit = nil
    }
    
    init(die: Dice, onEdit: @escaping () -> Void) {
        self.die = die
        self.onEdit = onEdit
    }

}

// MARK: - Previews

#Preview {
    DiceListCard(die: Dice.example.d6)
}

#Preview {
    DiceListCard(die: Dice.example.d6, onEdit: { } )
}
