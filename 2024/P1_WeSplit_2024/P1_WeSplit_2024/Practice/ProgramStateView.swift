//
//  ProgramStateView.swift
//  WeSplit2024
//
//  Created by  Ty Vaughan on 2/13/24.
//

import SwiftUI

struct ProgramStateView: View {
    @State private var tapCount = 0
    
    var body: some View {
        Button("Tap Count: \(tapCount)") {
            tapCount += 1
        }
    }
}

#Preview {
    ProgramStateView()
}
