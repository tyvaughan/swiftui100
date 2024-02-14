//
//  AnimatingGestures.swift
//  P6_Animations
//
//  Created by  Ty Vaughan on 6/15/23.
//

import SwiftUI

struct AnimatingGestures: View {
    let letters = Array("Hello SwiftUI")
    
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                ForEach(0..<letters.count, id: \.self) { num in
                    Text(String(letters[num]))
                        .padding(5)
                        .font(.title)
                        .background(enabled ? .blue : .red)
                        .offset(dragAmount)
                        .animation(.default.delay(Double(num) / 20), value: dragAmount)
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
            
            LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(width: 150, height: 100)
                .offset(dragAmount) // .offset allows us to change the X and Y coordinate of a View without affecting other Views
                .gesture(
                    DragGesture()
                        .onChanged { dragAmount = $0.translation }
                        .onEnded { _ in
                            withAnimation(.spring()) { // we can use an explicit animation
                                dragAmount = .zero
                            }
                        }
                )
            //            .animation(.spring(), value: dragAmount) // we can use implicit animations using the .animation modifier
        }
    }
}

struct AnimatingGestures_Previews: PreviewProvider {
    static var previews: some View {
        AnimatingGestures()
    }
}
