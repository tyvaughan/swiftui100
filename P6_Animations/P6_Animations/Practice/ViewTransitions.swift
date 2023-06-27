//
//  ViewTransitions.swift
//  P6_Animations
//
//  Created by  Ty Vaughan on 6/15/23.
//

import SwiftUI

struct ViewTransitions: View {
    
    @State private var isShowingRed = true
    
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
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
    }
}

struct ViewTransitions_Previews: PreviewProvider {
    static var previews: some View {
        ViewTransitions()
    }
}
