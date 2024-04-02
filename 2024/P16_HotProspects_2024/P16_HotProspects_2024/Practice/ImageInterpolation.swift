//
//  ImageInterpolation.swift
//  P16_HotProspects_2024
//
//  Created by  Ty Vaughan on 4/1/24.
//

import SwiftUI

/*
 Image interpolation is where an image is expanded beyond its original size, and the transition between pixes is smoothed out.
 */

struct ImageInterpolation: View {

    var body: some View {
        Image("p1_front")
            .interpolation(.none)
            .resizable()
            .scaledToFit()
            .background(.black)
    }
}

#Preview {
    ImageInterpolation()
}
