//
//  MoveButton.swift
//  M1_RockPaperScissors_2024
//
//  Created by  Ty Vaughan on 2/22/24.
//

import SwiftUI

struct MoveButton: View {
    public let color: Color
    public let move: Move
    public let onClick: (_ move: Move) -> Void

    var body: some View {
        Button {
            onClick(move)
        } label: {
            Text(move.rawValue)
                .font(.system(size: 48))
                .padding(20)
                .background(color)
                .cornerRadius(32)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 0, y: 8)
        }
    }
}

#Preview {
    MoveButton(
        color: K.colors[0],
        move: Move.paper,
        onClick: { (move: Move) in return }
    )
}
