//
//  ContentView.swift
//  P4_BetterRest_2024
//
//  Created by  Ty Vaughan on 2/23/24.
//

import CoreML
import SwiftUI

struct ContentView: View {

    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var showBedtimeAlert = false
    @State private var bedtimeAlertTitle = ""
    @State private var bedtimeAlertMessage = ""
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    var calculatedBedtime: String {
        if let bedtime = try? calculateBedtime() {
            return bedtime.formatted(date: .omitted, time: .shortened)
        }
        return ""
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("When do you want to wake up?") {
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                
                Section("Desired amount of sleep") {
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }

                
                Section("Daily coffee intake") {
                    Picker("How many cups?", selection: $coffeeAmount) {
                        ForEach(1..<21, id: \.self) {
                            Text("^[\($0) cup](inflect: true)")
                                .tag($0)
                        }
                    }
                }
                
                Section("Calculated Bedtime") {
                    Text(calculatedBedtime)
                }
            }
            .navigationTitle("BetterRest")
            .toolbar {
                Button("Calculate", action: showBedTime)
            }
            .alert(bedtimeAlertTitle, isPresented: $showBedtimeAlert) {
                Button("Okay") {}
            } message: {
                Text(bedtimeAlertMessage)
            }
        }
    }
    
    func showBedTime() {
        do {
            let bedtime = try calculateBedtime()
            bedtimeAlertTitle = "Your ideal bedtime is..."
            bedtimeAlertMessage = bedtime.formatted(date: .omitted, time: .shortened)
        } catch {
            bedtimeAlertTitle = "Error"
            bedtimeAlertMessage = "Sorry, there was a problem calculating your bedtime."
        }
        showBedtimeAlert = true
    }
    
    func calculateBedtime() throws -> Date {
        let config = MLModelConfiguration()
        let model = try SleepCalculator(configuration: config)
        
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (components.hour ?? 0) * 60 * 60
        let minute = (components.minute ?? 0) * 60
        let wakeTime = Int64(hour + minute)
        
        // Get prediction result in seconds
        let prediction = try model.prediction(wake: wakeTime, estimatedSleep: sleepAmount, coffee: 1)
        
        // Subtract sleep from desired wake up time
        let sleepTime = wakeUp - prediction.actualSleep
        return sleepTime
    }
}

#Preview {
    ContentView()
}
