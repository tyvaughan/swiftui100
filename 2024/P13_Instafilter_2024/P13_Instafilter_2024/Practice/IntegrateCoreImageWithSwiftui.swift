//
//  IntegrateCoreImageWithSwiftui.swift
//  P13_Instafilter_2024
//
//  Created by  Ty Vaughan on 3/19/24.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct IntegrateCoreImageWithSwiftui: View {
    @State private var image: Image?

    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
        }
        .onAppear(perform: loadImage)
    }
    
    func loadImage() {
        // Load the image and convert it to a CIImage
        let inputImage = UIImage(resource: .apollo1)
        let beginImage = CIImage(image: inputImage)
        
        // Create a CIContext and customize the filter settings
        let context = CIContext()
        let currentFilter = CIFilter.pixellate()
        currentFilter.inputImage = beginImage
        
        // Customize image more
        let amount = 1.0
        let inputKeys = currentFilter.inputKeys
        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(amount, forKey: kCIInputIntensityKey)
        }
        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(amount * 200, forKey: kCIInputRadiusKey)
        }
        if inputKeys.contains(kCIInputScaleKey) {
            currentFilter.setValue(amount * 10, forKey: kCIInputScaleKey)
        }
        
        // get a CIImage from our filter or exit if that fails
        guard let outputImage = currentFilter.outputImage else { return }
        
        // attempt to get a CGImage from our CIImage
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }
        
        // convert that to a UIImage
        let uiImage = UIImage(cgImage: cgImage)
        
        // and convert that to a SwiftUI image
        image = Image(uiImage: uiImage)
    }
}

#Preview {
    IntegrateCoreImageWithSwiftui()
}
