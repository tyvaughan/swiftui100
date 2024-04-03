//
//  DisablingUserInteractivity.swift
//  P17_Flashzilla_2024
//
//  Created by  Ty Vaughan on 4/2/24.
//

import SwiftUI

struct DisablingUserInteractivity: View {
    var body: some View {
        VStack {
            
            /*
             By default, we can click the circle on top, or the rectangle in the exposed corners behind the circle, even though the Circle's frame overlaps the Rectangles entirely. This is b/c by default, transparent parts of a frame are ignored.
             
             We can control this interactivity in two ways:
               1. use the allowHitTesting() modifier. When this is used and set to false, the view is not tappable at all. Instead, anything behind that view will get tapped.
               2. use the contentShape() modifier. When this is used, we can specify a new shape for a View to accept gestures in. E.g. a Circle View's default tappable shape is a circle, but we can modify it to a rectangle.
             */
            ZStack {
                Rectangle()
                    .fill(.blue)
                    .frame(width: 100, height: 100)
                    .onTapGesture {
                        print("Rectangle tapped!")
                    }
                Circle()
                    .fill(.red)
                    .frame(width: 100, height: 100)
                    .contentShape(.rect)
                    .onTapGesture {
                        print("Circle tapped!")
                    }
                    .allowsHitTesting(true)
            }
            
            VStack {
                Text("Hello")
                Spacer()
                Text("World")
            }
            .frame(width: 100, height: 100)
            .contentShape(.rect) // Allow the spacer to also register taps!
            .onTapGesture {
                print("VStack tapped!")
            }
            
        }
    }
}

#Preview {
    DisablingUserInteractivity()
}
