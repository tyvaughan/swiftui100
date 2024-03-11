//
//  HapticEffects.swift
//  P10_CupcakeCorner_2024
//
//  Created by  Ty Vaughan on 3/11/24.
//

import CoreHaptics
import SwiftUI

struct HapticEffects: View {
    @State private var counter = 0
    @State private var engine: CHHapticEngine?
    
    var body: some View {
        /*
         Apple provides a variety of effects for haptic feedback that correlate with different scenarios.
         */
        Button("Tap count: \(counter)") {
            counter += 1
        }
        .sensoryFeedback(.increase, trigger: counter)
        
        /*
         Simple custom haptic effects can be specified using impact()
         */
        Button("Tap count: \(counter)") {
            counter += 1
        }
        .sensoryFeedback(.impact(flexibility: .soft, intensity: 0.5), trigger: counter)
        Button("Tap count: \(counter)") {
            counter += 1
        }
        .sensoryFeedback(.impact(weight: .heavy, intensity: 0.5), trigger: counter)
        
        /*
         Advanced haptics can be achieved using CoreHaptics
         */
        Button("Tap count: \(counter)") {
            complexSuccess()
        }
        .onAppear(perform: prepareHaptics)
    }
    
    func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("There was an error creating the engine: \(error.localizedDescription)")
        }
    }
    
    func complexSuccess() {
        // make sure that the device supports haptics
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        var events = [CHHapticEvent]()
        
        for i in stride(from: 0, to: 1, by: 0.1) {
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(i))
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(i))
            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: i)
            events.append(event)
        }

        for i in stride(from: 0, to: 1, by: 0.1) {
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1 - i))
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1 - i))
            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 1 + i)
            events.append(event)
        }
        
        // convert those events into a pattern and play it immediately
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play pattern: \(error.localizedDescription)")
        }
    }
}

#Preview {
    HapticEffects()
}
