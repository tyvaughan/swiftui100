//
//  IdentifyingViewsWithLabels.swift
//  P15_Accessibility_2024
//
//  Created by  Ty Vaughan on 3/26/24.
//

import SwiftUI

struct IdentifyingViewsWithLabels: View {
    let pictures = [
        "ales-krivec-15949",
        "galina-n-189483",
        "kevin-horstmann-141705",
        "nicolas-tissot-335096"
    ]
    
    let labels = [
        "Tulips",
        "Frozen tree buds",
        "Sunflowers",
        "Fireworks"
    ]
    
    @State private var selectedPicture = Int.random(in: 0...3)
    
    var body: some View {
        /**
         Here we have a clickable image.
         We add an accessibility label, which VoiceOver will immediately read when the image is selected.
         We also add the button trait and remove the image trait so that the element is properly represented by VoiceOver
         */
//        Image(pictures[selectedPicture])
//            .resizable()
//            .scaledToFit()
//            .onTapGesture {
//                selectedPicture = Int.random(in: 0...3)
//            }
//            .accessibilityLabel(labels[selectedPicture])
//            .accessibilityAddTraits(.isButton)
//            .accessibilityRemoveTraits(.isImage)
        
        /**
         We should use a Button when possible so that we don't need to manually adjust traits
         */
        Button {
            selectedPicture = Int.random(in: 0...3)
        } label: {
            Image(pictures[selectedPicture])
                .resizable()
                .scaledToFit()
        }
        .accessibilityLabel(labels[selectedPicture])
    }
}

#Preview {
    IdentifyingViewsWithLabels()
}
