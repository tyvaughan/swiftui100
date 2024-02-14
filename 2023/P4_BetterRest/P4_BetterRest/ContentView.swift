//
//  ContentView.swift
//  P4_BetterRest
//
//  Created by  Ty Vaughan on 6/8/23.
//

import CoreML
import SwiftUI

struct ContentView: View {
    
    @State private var coffeeAmount = 1
    @State private var sleepAmount = 8.0
    @State private var wakeUp = defaultWakeTime
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    // MARK: - Hey
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    /*
     We can create one-sided ranges in Swift, where Swift will automatically determine the unprovided end of the range
     For example, Date.now... will contain date value from the current time into the future
     */
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.white, .gray], startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)

                Form {
                    // OLD UI
                    //                Group {
                    //                    VStack(alignment: .leading) {
                    //                        Text("When do you want to wake up?")
                    //                            .font(.headline)
                    //                        DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                    //                            .labelsHidden() // the .labelsHidden modifier allows us to not visually display a label but still have it be active for screen readers (aka VoiceOver)
                    //                    }
                    //
                    //                    VStack(alignment: .leading) {
                    //                        Text("Desired amount of sleep")
                    //                            .font(.headline)
                    //                        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                    //                    }
                    //
                    //                    VStack(alignment: .leading) {
                    //                        Text("Daily coffee intake")
                    //                            .font(.headline)
                    //                        Stepper(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups", value: $coffeeAmount, in: 1...20)
                    //                    }
                    //                }
                    
                    // NEW UI
                    Group {
                        Section("When do you want to wake up") {
                            DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                                .labelsHidden() // the .labelsHidden modifier allows us to not visually display a label but still have it be active for screen readers (aka VoiceOver)
                        }
                        
                        Section("Desired amount of sleep") {
                            Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                        }
                        
                        Section("Daily coffee intake") {
                            Picker("Number of cups", selection: $coffeeAmount) {
                                ForEach(1...20, id: \.self) {
                                    Text($0 == 1 ? "1 cup" : "\($0) cups")
                                }
                            }
                            .pickerStyle(.navigationLink)
                        }
                    }
                    
                    Section("Recommended Bedtime") {
                        Text("\(calculatedBedtime.formatted(date: .omitted, time: .shortened))")
                            .font(.largeTitle)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    
                }
                .scrollContentBackground(.hidden)
            }
            .navigationTitle("BetterRest")
            .toolbar {
                Button("Calculate", action: calculateBedtime)
            }
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("OK") {}
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    func calculateBedtime() {
        do {
            let config = MLModelConfiguration()
            let model = try P4_BetterRest_TabularRegressor_1(configuration: config)
            
            // Get total seconds for wake up time
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            // Get the prediction for actual sleep time
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            // Determine the time the user should go to sleep
            let sleepTime = wakeUp - prediction.actualSleep
            alertTitle = "Your ideal bedtime is..."
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
        showingAlert = true
    }
    
    /**
     Description of the function
     
     ~~~
     // Code example
     let date = Date.now
     ~~~
     
     - Returns: the date for the calculated bed time
     */
    var calculatedBedtime: Date {
        do {
            let config = MLModelConfiguration()
            let model = try P4_BetterRest_TabularRegressor_1(configuration: config)
            
            // Get total seconds for wake up time
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            // Get the prediction for actual sleep time
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            // Determine the time the user should go to sleep
            let sleepTime = wakeUp - prediction.actualSleep
            return sleepTime
        } catch {
            // Default to 10pm
            var components = DateComponents()
            components.hour = 22
            components.minute = 0
            let sleepTime = Calendar.current.date(from: components) ?? Date.now
            return sleepTime
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
