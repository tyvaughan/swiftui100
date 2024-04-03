//
//  TriggeringEventsWithTimer.swift
//  P17_Flashzilla_2024
//
//  Created by  Ty Vaughan on 4/2/24.
//

import SwiftUI

/*
 Timer is from Apple's Foundation library. Timer has an extension from Combine that allows a Timer to be used as a publisher.
 
 The .onReceive() modifier can be used to subscribe to a publisher and perform an action when a new value is published.
 */

struct TriggeringEventsWithTimer: View {
    
    /*
     When we make a new Timer we can provide these values:
     - every: the number of seconds between each published value
     - tolerance: the window that the OS can delay the publish; allows the OS to do timer coalescing, where it can idle longer and optimize trigger multiple timers at once.
     - on: which thread to run the timer on
     - in: which run loop to run the timer on
     */
    let timer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: .common).autoconnect()
    @State private var counter = 0
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onReceive(timer) { time in
                if counter < 5 {
                    print("The time is now \(time) -- \(counter)")
                } else {
                    timer.upstream.connect().cancel()
                }
                counter += 1
            }
    }
}

#Preview {
    TriggeringEventsWithTimer()
}
