//
//  SimpleDivider.swift
//  P8_Moonshot_2024
//
//  Created by  Ty Vaughan on 3/5/24.
//

import SwiftUI

struct SimpleDivider: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}

#Preview {
    SimpleDivider()
}
