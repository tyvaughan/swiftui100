//
//  DiceSetAddView.swift
//  M6_DiceMaster_2024
//
//  Created by  Ty Vaughan on 4/17/24.
//

import SwiftData
import SwiftUI

struct DiceSetAddView: View {
    @Environment(\.dismiss) var dismiss

    @State private var name: String
    @State private var description: String
    @State private var dice: [Dice]
    
    @State private var isShowingDiceDetailsView: Bool = false
    @State private var selectedDie: Dice? = nil
    
    var diceSet: DiceSet
    var onSave: (DiceSet) -> Void
    
    var body: some View {
        Form {
                    
            /*
             Dice set detils
             */
            Section("Details") {
                TextField("Description", text: $description, axis: .vertical)
            }

            /*
             Dice list
             */
            Section {
                VStack {
                    HStack {
                        Text("Dice")
                            .font(.title)
                        Spacer()
                        Button {
                            addDie()
                        } label: {
                            Image(systemName: "plus")
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                    .padding([.leading, .trailing])
                    
                    /*
                     
                     ISSUE ISSUE ISSUE ISSUE ISSUE
                     
                     Clicking the dice section clicks all links and buttons within the dice section
                     
                     */
                    if dice.count > 0 {
                        List(dice, id: \.id) { die in
                            Button {
                                selectedDie = die
                                isShowingDiceDetailsView = true
                            } label: {
                                DiceListCard(die: die)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    } else {
                        ContentUnavailableView {
                            Label("No dice!", systemImage: "Square")
                        } description: {
                            Text("Add some dice")
                        } actions: {
                            // perform actions
                        }
                    }
                }
                .padding(.bottom, 40)
            }
        }
        .navigationTitle($name)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .navigationDestination(isPresented: $isShowingDiceDetailsView) {
            if let selectedDie = selectedDie {
                DiceEditView(die: selectedDie, allowEdits: true)
            }
        }
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .primaryAction) {
                Button("Save") {
                    dismiss()
                    diceSet.name = name
                    diceSet.context = description
                    diceSet.dice = dice
                    onSave(diceSet)
                }
            }
        }
    }
    
    // MARK: Initializers
    
    init(diceSet: DiceSet, onSave: @escaping (DiceSet) -> Void) {
        _name = State(initialValue: diceSet.name)
        _description = State(initialValue: diceSet.context)
        _dice = State(initialValue: diceSet.dice)
        self.diceSet = diceSet
        self.onSave = onSave
    }
    
    func addDie() -> Void {
        dice.append(
            Dice(
                name: "New die",
                type: .d6,
                sides: Array(1...DiceType.d6.rawValue).map { String($0) },
                dieColor: .white,
                valueColor: .black
            )
        )
    }
}

#Preview {
    NavigationStack {
        DiceSetAddView(diceSet: DiceSet.example, onSave: { _ in })
    }
    .modelContainer(for: [
        Dice.self,
        DiceSet.self
    ], inMemory: true)
}
