//
//  MoveButtonView.swift
//  M1_RockPaperScissors
//
//  Created by  Ty Vaughan on 6/7/23.
//

import SwiftUI

struct MoveButtonView: View {
    var title: String
    var onClick: () -> Void

    var body: some View {
        Button {
            onClick()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 80, height: 80)
                Text(title)
                    .font(.system(size: 60))
            }
        }
    }
}

struct MoveButtonView_Previews: PreviewProvider {
    static var previews: some View {
        MoveButtonView(title: "🪨", onClick: {})
    }
}
