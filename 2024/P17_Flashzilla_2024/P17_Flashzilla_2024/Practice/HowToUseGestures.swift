//
//  HowToUseGestures.swift
//  P17_Flashzilla_2024
//
//  Created by  Ty Vaughan on 4/2/24.
//

import SwiftUI

struct HowToUseGestures: View {
    // Magnify gesture properties
    @State private var currentMagnifyAmount = 0.0
    @State private var finalMagnifyAmount = 1.0
    
    // Rotate gesture properties
    @State private var currentAngleAmount = Angle.zero
    @State private var finalAngleAmount = Angle.zero
    
    // Sequenced gesture properties
    @State private var offset = CGSize.zero
    @State private var isDragging = false
    
    var body: some View {
        VStack {
            Text("Double tap me")
                .onTapGesture(count: 2) {
                    print("Double tapped!")
                }
            
            Text("Long press me")
                .onLongPressGesture(minimumDuration: 1) {
                    print("Long pressed!")
                } onPressingChanged: { inProgress in
                    print("In progress: \(inProgress)!")
                }
            
            Text("Magnify gesture me")
                .scaleEffect(finalMagnifyAmount + currentMagnifyAmount)
                .gesture(
                    MagnifyGesture()
                        .onChanged { value in
                            currentMagnifyAmount = value.magnification - 1
                            print("\(finalMagnifyAmount) + \(currentMagnifyAmount)")
                        }
                        .onEnded { value in
                            finalMagnifyAmount += currentMagnifyAmount
                            currentMagnifyAmount = 0
                        }
                )
            
            Text("Rotate gesture me")
                .rotationEffect(currentAngleAmount + finalAngleAmount)
                .gesture(
                    RotateGesture()
                        .onChanged { value in
                            currentAngleAmount = value.rotation
                        }
                        .onEnded { value in
                            finalAngleAmount += currentAngleAmount
                            currentAngleAmount = Angle.zero
                        }
                )
            
            /*
             When there is a clash between a parent view's gesture and the child view's gesture, Swift will prioritze the child View's gesture.
             */
            VStack {
                Text("Gesture clash #1")
                    .onTapGesture {
                        print("Text tapped")
                    }
            }
            .onTapGesture {
                print("VStack tapped")
                
            }
            
            /*
             If we want a parent View's gesture to be prioritzed over a child's, we can use highPriorityGesture.
             */
            VStack {
                Text("Gesture clash #2")
                    .onTapGesture {
                        print("Text tapped")
                    }
            }
            .highPriorityGesture(
                TapGesture()
                    .onEnded {
                        print("VStack tapped")
                    }
            )
            
            /*
             If we want to trigger both a parent's and child's gesture, we can use simultaneousGesture.
             */
            VStack {
                Text("Gesture clash #3")
                    .onTapGesture {
                        print("Text tapped")
                    }
            }
            .simultaneousGesture(
                TapGesture()
                    .onEnded {
                        print("VStack tapped")
                    }
            )
            
            /*
             We can sequence gestures too. To do this, we'll use:
               1. a drag gesture that updates offset and isDragging as it moves around
               2. a long press gesture that enables isDragging
               3. a combined gesture that forces the user to long press then drag
             
             All sequenced gestures must be available in scope to be used in a sequence.
             */
            let dragGesture = DragGesture()
                .onChanged { value in offset = value.translation }
                .onEnded { _ in
                    withAnimation {
                        offset = .zero
                        isDragging = false
                    }
                }
            let pressGesture = LongPressGesture()
                .onEnded { value in
                    withAnimation {
                        isDragging = true
                    }
                }
            let combined = pressGesture.sequenced(before: dragGesture)
            Circle()
                .fill(.red)
                .frame(width: 64, height: 64)
                .scaleEffect(isDragging ? 1.5 : 1)
                .offset(offset)
                .gesture(combined)
            
        }
    }
}

#Preview {
    HowToUseGestures()
}
