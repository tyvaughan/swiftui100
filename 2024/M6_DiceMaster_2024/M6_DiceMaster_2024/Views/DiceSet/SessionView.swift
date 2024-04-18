//
//  SessionView.swift
//  M6_DiceMaster_2024
//
//  Created by  Ty Vaughan on 4/5/24.
//

import SwiftData
import SwiftUI

struct SessionView: View {
    @State private var diceToRoll: [Int]
    @State private var rollResults: [RollResult] = []
    
    var diceSet: DiceSet
    
    var body: some View {
        List {
            VStack {
                ForEach(0..<diceSet.dice.count, id: \.self) { index in
                    HStack {
                        HStack {
                            DiceImage(die: diceSet.dice[index])
                            Text("x\(diceToRoll[index])")
                        }
                        Spacer()
                        Stepper("Quantity of die", value: $diceToRoll[index], in: 0...20)
                            .labelsHidden()
                    }
                }
                Button("Roll!") {
                    roll()
                }
            }
            Section("Results") {
                ForEach(rollResults) { rollResult in
                    VStack(alignment: .leading) {
                        HStack {
                            ForEach(rollResult.results) { diceResult in
                                DiceImage(die: diceResult.dice, value: diceResult.result)
                            }
                        }
                        Text(rollResult.date.formatted())
                            .font(.caption)
                    }
                }
            }
        }
        .listStyle(.plain)
        .listSectionSeparator(.hidden)
    }
    
    init(diceSet: DiceSet) {
        _diceToRoll = State(initialValue: Array(repeating: 0, count: diceSet.dice.count))
        self.diceSet = diceSet
    }
    
    func roll() -> Void {
        var diceResults = [DiceResult]()
        for i in 0..<diceToRoll.count {
            for _ in 0..<diceToRoll[i] {
                diceResults.append(
                    DiceResult(
                        dice: diceSet.dice[i],
                        result: diceSet.dice[i].roll()
                    )
                )
            }
        }
        print(diceResults)
        rollResults.insert(RollResult(results: diceResults, date: .now), at: 0)
    }
}

#Preview {
    NavigationStack {
        SessionView(diceSet: DiceSet.example)
    }
    .modelContainer(for: [
        Dice.self,
        DiceSet.self
    ], inMemory: true)
}
