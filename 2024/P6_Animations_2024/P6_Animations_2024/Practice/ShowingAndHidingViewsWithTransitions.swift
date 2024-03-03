//
//  ShowingAndHidingViewsWithTransitions.swift
//  P6_Animations_2024
//
//  Created by  Ty Vaughan on 2/28/24.
//

import SwiftUI

struct ShowingAndHidingViewsWithTransitions: View {
    
    @State private var isShowingRed = false
    
    var body: some View {
        VStack {
            Button("Tap me") {
                withAnimation {
                    isShowingRed.toggle()
                }
            }
            
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.scale)
                
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(
                        .asymmetric(insertion: .scale, removal: .opacity)
                    )
            }
        }
    }
}

#Preview {
    ShowingAndHidingViewsWithTransitions()
}
