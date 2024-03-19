//
//  PropertyWrapperStructs.swift
//  P13_Instafilter_2024
//
//  Created by  Ty Vaughan on 3/19/24.
//

import SwiftUI

/*
 Notice in this example: hitting the button prints from didSet, but changing the slider doesn't. Why?
 
 @State is a struct that wraps the blurAmount value. When we pass a binding, it directly changes the wrapped value, it doesn't go through the nonmutating setter of the State struct.
 
 When we assign directly to blurAmount, it is using the nonmutating setter, which will trigger the didSet hook.
 
 How we can fix this?
 */

struct PropertyWrapperStructs: View {
    @State private var blurAmount = 0.0 {
        didSet {
            print("New value is \(blurAmount)")
        }
    }

    var body: some View {
        VStack {
            Text("Hello, world!")
                .blur(radius: blurAmount)
            
            Slider(value: $blurAmount, in: 0...20)
            
            Button("Random blur") {
                blurAmount = Double.random(in: 0...20)
            }
        }
    }
}

#Preview {
    PropertyWrapperStructs()
}
