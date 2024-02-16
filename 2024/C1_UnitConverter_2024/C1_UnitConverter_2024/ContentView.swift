//
//  ContentView.swift
//  C1_UnitConverter_2024
//
//  Created by  Ty Vaughan on 2/16/24.
//

import SwiftUI

struct ContentView: View {
    private let unitChoices: [UnitVolume] = [ .milliliters, .liters, .cups, .pints, .gallons ]
    
    @State private var amount: Double = 0.0
    @FocusState private var amountIsFocused: Bool
    
    @State private var curUnit: UnitVolume = .milliliters
    @State private var newUnit: UnitVolume = .milliliters
    
    private var convertedAmount: Double {
        let measurement = Measurement(value: amount, unit: curUnit)
        return measurement.converted(to: newUnit).value
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $amount, format: .number)
                        .focused($amountIsFocused)
                        .keyboardType(.decimalPad)
                }
                Section("Current unit of measure") {
                    Picker("Current unit of measure", selection: $curUnit) {
                        ForEach(unitChoices, id: \.self) { unit in
                            Text("\(unit.symbol)")
                                .tag(unit)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("New unit of measure") {
                    Picker("New unit of measure", selection: $newUnit) {
                        ForEach(unitChoices, id: \.self) { unit in
                            Text("\(unit.symbol)")
                                .tag(unit)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Converted amount") {
                    Text("\(convertedAmount, specifier: "%.2f") \(newUnit.symbol)")
                }
            }
            .navigationTitle("Unit Converter")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
