//
//  ViewCompositionView.swift
//  P3_ViewsAndModifiers_2024
//
//  Created by  Ty Vaughan on 2/21/24.
//

import SwiftUI

struct ViewCompositionView: View {
    var body: some View {
        VStack(spacing: 10) {
            CapsuleText(text: "First")
                .foregroundStyle(.white)
            CapsuleText(text: "Second")
                .foregroundStyle(.yellow)
        }
    }
}

struct CapsuleText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .background(.blue)
            .clipShape(.capsule)
    }
}

#Preview {
    ViewCompositionView()
}
