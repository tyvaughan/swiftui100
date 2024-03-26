//
//  HidingAndGroupingAccessibilityData.swift
//  P15_Accessibility_2024
//
//  Created by  Ty Vaughan on 3/26/24.
//

import SwiftUI

struct HidingAndGroupingAccessibilityData: View {

    var body: some View {
        VStack {
            /**
             Using the decorative property allows us to specify that an image should not have its name or label read by VoiceOver.
             
             Using the accessibilityHidden modifier makes the View entirely invisible to VoiceOver.
             */
            Image(decorative: "ales-krivec-15949")
                .resizable()
                .scaledToFit()
                .onTapGesture {
                    // return
                }
                .accessibilityHidden(true)
            
            /**
             We can also group elements together, ignore accessibility for each child element, and then give the full group a meaningful label.
             */
            VStack {
                Text("Your score is")
                Text("1000")
                    .font(.title)
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Your score is 1000")
        }
    }

}

#Preview {
    HidingAndGroupingAccessibilityData()
}
