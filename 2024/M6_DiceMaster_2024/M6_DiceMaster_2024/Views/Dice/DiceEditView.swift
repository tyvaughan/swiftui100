//
//  DiceEditView.swift
//  M6_DiceMaster_2024
//
//  Created by  Ty Vaughan on 4/4/24.
//

import SwiftData
import SwiftUI

struct DiceEditView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    @State private var name: String
    @State private var type: DiceType
    @State private var sides: [String]
    
    @State private var dieColor: Color
    @State private var valueColor: Color
    
    @State private var allowEdits = false
    
    public var die: Dice
    
    var displayValue: String {
        sides.count > 0 && !sides[0].trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? sides[0] : "Value"
    }
    
    var body: some View {
        Form {
            Section {
                HStack(alignment: .center) {
                    ZStack {
                        Image(systemName: "square.fill")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .foregroundColor(dieColor)
                            .shadow(color: .black, radius: 4)
                        Text("\(displayValue)")
                            .font(.headline)
                            .foregroundStyle(valueColor)
                    }
                }
                .frame(maxWidth: .infinity, minHeight: 140)
                ColorPicker("Die Color", selection: $dieColor)
                    .disabled(!allowEdits)
                ColorPicker("Value Color", selection: $valueColor)
                    .disabled(!allowEdits)
            }
            
            Section {
                TextField("Name", text: $name)
                    .disabled(!allowEdits)
                Picker("Type", selection: $type) {
                    ForEach(DiceType.allCases, id: \.self) { diceType in
                        Text(String(describing: diceType))
                            .tag(diceType)
                    }
                }
                .disabled(!allowEdits)
            }
            
            Section("Sides") {
                ForEach(0..<sides.count, id: \.self) { index in
                    TextField("Value", text: $sides[index])
                }
                .disabled(!allowEdits)
            }

        }
        .onChange(of: type, updateSides)
        .navigationTitle("Dice Details")
        .toolbar {
            if allowEdits {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        onSave()
                        allowEdits = false
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        onReset()
                        allowEdits = false
                    }
                }
            }
            if !allowEdits {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Edit") {
                        allowEdits = true
                    }
                }
            }
        }
    }
    
    init(die: Dice, allowEdits: Bool = false) {
        self.name = die.name
        self.type = die.type
        self.sides = die.sides
        self.dieColor = Color(hex: die.dieColor)
        self.valueColor = Color(hex: die.valueColor)
        self.die = die
        self.allowEdits = allowEdits
    }
    
    func onSave() -> Void {
        // SwiftData auto-saves on changes
        die.name = name
        die.type = type
        die.sides = sides
        die.dieColor = dieColor.toHex!
        die.valueColor = valueColor.toHex!
    }
    
    func onReset() -> Void {
        self.name = die.name
        self.type = die.type
        self.sides = die.sides
    }
    
    func updateSides() -> Void {
        sides.resize(to: type.rawValue)
    }
}

#Preview {
    NavigationStack {
        DiceEditView(die: Dice.example.d4, allowEdits: true)
    }
    .modelContainer(for: [
        Dice.self,
        DiceSet.self
    ], inMemory: true)
}
