//
//  CardView.swift
//  P17_Flashzilla_2024
//
//  Created by  Ty Vaughan on 4/2/24.
//

import SwiftUI

struct CardView: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityVoiceOverEnabled) var voiceOverEnabled

    @State private var isShowingAnswer = false
    @State private var offset = CGSize.zero
    
    let card: Card
    var onRemove: ((Bool, () -> Void) -> Void)? = nil
    
    var cardBackgroundFill: Color {
        differentiateWithoutColor
            ? .white
            : .white.opacity(1 - Double(abs(offset.width / 50)))
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(cardBackgroundFill)
                .cardBackground(at: offset, differentiateWithoutColor)
                .shadow(radius: 10)

            VStack {
                if voiceOverEnabled {
                    Text(isShowingAnswer ? card.answer : card.prompt)
                        .font(.largeTitle)
                        .foregroundStyle(.black)
                } else {
                    Text(card.prompt)
                        .font(.largeTitle)
                        .foregroundStyle(.black)
                    if isShowingAnswer {
                        Text(card.answer)
                            .font(.title)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .frame(width: 450, height: 250)
        .rotationEffect(.degrees(offset.width / 5.0))
        .offset(x: offset.width * 5)
        .opacity(2 - Double(abs(offset.width / 50)))
        .accessibilityAddTraits(.isButton)
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                }
                .onEnded { _ in
                    if abs(offset.width) > 100 {
                        onRemove?(offset.width > 0 ? true : false, resetOffset)
                    } else {
                        offset = .zero
                    }
                }
        )
        .onTapGesture {
            isShowingAnswer.toggle()
        }
        .animation(.bouncy, value: offset)
        .onAppear {
            print("Offset: \(offset.width)")
            offset = .zero
        }
    }
    
    func resetOffset() -> Void {
        offset = .zero
    }
}

#Preview {
    CardView(card: Card.example)
}
