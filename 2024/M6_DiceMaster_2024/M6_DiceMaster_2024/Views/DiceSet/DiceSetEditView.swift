//
//  DiceSetEditView.swift
//  M6_DiceMaster_2024
//
//  Created by  Ty Vaughan on 4/4/24.
//

import SwiftUI

struct DiceSetEditView: View {
    @Environment(\.dismiss) var dismiss
    @State private var name: String
    @State private var description: String
    
    var diceSet: DiceSet
    
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
            Section("Dice") {
                VStack {
                    HStack {
                        Text("Dice")
                            .font(.title)
                        Spacer()
                        Button {
                            diceSet.dice.append(
                                Dice(
                                    name: "New die",
                                    type: .d6,
                                    sides: Array(0...DiceType.d6.rawValue).map { String($0) },
                                    dieColor: .white,
                                    fontColor: .black
                                )
                            )
                            print(diceSet.dice.count)
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                    .padding([.leading, .trailing])
                    
                    VStack {
                        if diceSet.dice.count > 0 {
                            ForEach(diceSet.dice, id: \.id) { die in
                                NavigationLink {
                                    DiceEditView(die: die)
                                } label: {
                                    DiceListCard(die: die)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        } else {
                            ContentUnavailableView {
                                Label("Hi", systemImage: "Square")
                            } description: {
                                Text("Hi")
                            } actions: {
                                // perform actions
                            }
                        }
                    }
                    .padding([.leading, .trailing])
                }
                .padding(.bottom, 40)
            }
            
        }
        .navigationTitle($name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .topBarTrailing) {
                NavigationLink("Edit") {
                    DiceSetEditView(diceSet: diceSet)
                }
            }
        }
    }
    
    init(diceSet: DiceSet) {
        _name = State(initialValue: diceSet.name)
        _description = State(initialValue: diceSet.description)
        self.diceSet = diceSet
    }
}

#Preview {
    NavigationStack {
        DiceSetEditView(diceSet: DiceSet.example)
    }
}
