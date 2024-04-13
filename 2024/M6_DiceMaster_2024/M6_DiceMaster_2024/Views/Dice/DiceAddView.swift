//
//  DiceAddView.swift
//  M6_DiceMaster_2024
//
//  Created by  Ty Vaughan on 4/4/24.
//

import SwiftUI

struct DiceAddView: View {
    var body: some View {
        VStack {
            ForEach(0..<100) { _ in
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

#Preview {
    NavigationStack {
        DiceAddView()
    }
}
