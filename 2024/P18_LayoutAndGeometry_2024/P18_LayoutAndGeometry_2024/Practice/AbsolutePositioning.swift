//
//  AbsolutePositioning.swift
//  P18_LayoutAndGeometry_2024
//
//  Created by  Ty Vaughan on 4/3/24.
//

import SwiftUI

/*
 SwiftUI gives us two ways to position views:
   - absolute position with the .position() modifier
   - relative position with the .offset() modifier
 
 When we use the .position() modifier, when view size is being resolved, the .position() modifier returns a View that takes up the entire space so that it can position its child view at the correct location.
 */

struct AbsolutePositioning: View {
    var body: some View {
        ZStack {
            Text("Absolute")
                .position(x: 100, y: 100)
                .background(.red)
            
            
            Text("Relative")
                .offset(x: 100, y: 100)
                .background(.green)
        }
    }
}

#Preview {
    AbsolutePositioning()
}
