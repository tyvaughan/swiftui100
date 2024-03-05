//
//  ResizingImages.swift
//  P8_Moonshot_2024
//
//  Created by  Ty Vaughan on 3/4/24.
//

import SwiftUI

struct ResizingImages: View {
    var body: some View {
        
        /*
         To have an image fit a specific size, we must use the resizable modifier.
         
         To modify how that image fits in the specified sized, we can use scaledToFill or scaledToFit.
         */
        
        Image(.apollo1)
            .resizable()
            .scaledToFill()
            .frame(width: 300, height: 200)
            .clipped()

        /*
         You can use the containerRelativeFrame modifier to size the image relative to the parent View
         */
        
        Image(.apollo1)
            .resizable()
            .scaledToFill()
            .containerRelativeFrame(.horizontal) { size, axis in
                size * 0.8
            }
            .containerRelativeFrame(.vertical) { size, axis in
                size * 0.25
            }
            .clipped()
    }
}

#Preview {
    ResizingImages()
}
