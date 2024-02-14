//
//  ContentView.swift
//  VolumeConverter
//
//  Created by  Ty Vaughan on 5/30/23.
//

import Foundation
import SwiftUI

struct ContentView: View {
    let unitsOfMeasure: [UnitVolume] = [.milliliters, .liters, .cups, .pints, .quarts, .gallons]

    @State var amount = 1.0
    @State var fromUom = UnitVolume.milliliters
    @State var toUom = UnitVolume.milliliters
    
    var toAmount: Double {
        Measurement(value: amount, unit: fromUom).converted(to: toUom).value
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        TextField("Amount", value: $amount, format: .number)
                    } header: {
                        Text("Amount")
                    }
                    Section {
                        Picker("Original UOM", selection: $fromUom) {
                            ForEach(unitsOfMeasure, id: \.self) { item in
                                Text("\(getVolumeAbbreviation(for: item))")
                            }
                        }
                        .pickerStyle(.segmented)
                    } header: {
                        Text("Original UOM")
                    }
                    Section {
                        Picker("New UOM", selection: $toUom) {
                            ForEach(unitsOfMeasure, id: \.self) { item in
                                Text("\(getVolumeAbbreviation(for: item))")
                            }
                        }
                        .pickerStyle(.segmented)
                    } header: {
                        Text("New UOM")
                    }
                }
                .aspectRatio(contentMode: .fit)
                HStack {
                    VStack {
                        Text("\(amount, specifier: "%.2f")")
                            .font(.system(size:36))
                        Text("From \(getVolumeAbbreviation(for: fromUom))")
                    }
                    .frame(maxWidth: .infinity)
                    VStack {
                        Text("\(toAmount, specifier: "%.2f")")
                            .font(.system(size:36))
                        Text("To \(getVolumeAbbreviation(for: toUom))")
                    }
                    .frame(maxWidth: .infinity)
                }
                Spacer()
            }
            .navigationTitle("Volume Converter")
        }
    }
}

func getVolumeAbbreviation(for uom: UnitVolume) -> String {
    switch uom {
        case .milliliters:
            return "mL"
        case .liters:
            return "L"
        case .cups:
            return "C"
        case .pints:
            return "pt"
        case .quarts:
            return "qt"
        case .gallons:
            return "gal"
        default:
            return "n/a"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
