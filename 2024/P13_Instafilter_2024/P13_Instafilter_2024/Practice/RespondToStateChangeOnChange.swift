//
//  RespondToStateChangeOnChange.swift
//  P13_Instafilter_2024
//
//  Created by  Ty Vaughan on 3/19/24.
//

import SwiftUI

/*
 The onChange modifier can be placed on any View struct in our View. It's recommended to keep it close to whatever View is modifying the value.
 */

struct RespondToStateChangeOnChange: View {
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
                .onChange(of: blurAmount) { oldValue, newValue in
                    print("New value is \(newValue)")
                }
            
            Button("Random blur") {
                blurAmount = Double.random(in: 0...20)
            }
        }
    }
}

#Preview {
    RespondToStateChangeOnChange()
}
