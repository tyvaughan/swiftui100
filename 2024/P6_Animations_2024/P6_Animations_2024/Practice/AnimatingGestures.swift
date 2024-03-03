//
//  AnimatingGestures.swift
//  P6_Animations_2024
//
//  Created by  Ty Vaughan on 2/28/24.
//

import SwiftUI

struct AnimatingGestures: View {
    let letters = Array("Hello SwiftUI")
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    
    @State private var cardDragAmount = CGSize.zero
    
    var body: some View {
        LinearGradient(colors: [.yellow, .red], startPoint: .top, endPoint: .bottom)
            .frame(width: 300, height: 200)
            .clipShape(.rect(cornerRadius: 10))
            .offset(cardDragAmount)
            .gesture(
                    DragGesture()
                        .onChanged { cardDragAmount = $0.translation }
                        .onEnded { _ in cardDragAmount = .zero }
            )
            .animation(.bouncy, value: cardDragAmount)
        
        HStack(spacing: 0) {
            ForEach(0..<letters.count, id: \.self) { num in
                Text(String(letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(enabled ? .blue : .red)
                    .offset(dragAmount)
                    .animation(.linear.delay(Double(num) / 20), value: dragAmount)
            }
        }
        .gesture(
            DragGesture()
                .onChanged { dragAmount = $0.translation }
                .onEnded { _ in
                    dragAmount = .zero
                    enabled.toggle()
                }
        )
    }
}

#Preview {
    AnimatingGestures()
}
