//
//  HowLayoutsWork.swift
//  P18_LayoutAndGeometry_2024
//
//  Created by  Ty Vaughan on 4/3/24.
//

import SwiftUI

struct HowLayoutsWork: View {
    var body: some View {
        /*
         For views that are not layout neutral, they will only take up the amount of size that they need.
         */
        Text("Hello, world!")
            .padding(20)
            .background(.red)
        
        /*
         For views that are layout neutral, they will automatically take up all of the space that is available to them.
         */
        Color.red
    }
}

#Preview {
    HowLayoutsWork()
}
