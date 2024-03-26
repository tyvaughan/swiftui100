//
//  HandlingVoiceInput.swift
//  P15_Accessibility_2024
//
//  Created by  Ty Vaughan on 3/26/24.
//

import SwiftUI

struct HandlingVoiceInput: View {
    var body: some View {
        VStack {
            Button("Tap me") {
                print("Button 1 tapped")
            }
            
            Button("John Fitzgerald Kennedy") {
                print("Button 2 tapped")
            }
            .accessibilityInputLabels([
                "John Fitzgerald Kennedy",
                "Kennedy",
                "JFK"
            ])
        }
    }
}

#Preview {
    HandlingVoiceInput()
}
