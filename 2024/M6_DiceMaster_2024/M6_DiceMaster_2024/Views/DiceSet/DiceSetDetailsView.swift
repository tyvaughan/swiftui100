//
//  DiceSetDetailsView.swift
//  M6_DiceMaster_2024
//
//  Created by  Ty Vaughan on 4/4/24.
//

import SwiftData
import SwiftUI

struct DiceSetDetailsView: View {
    
    var diceSet: DiceSet
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    
                    /*
                     Dice set detils
                     */
                    HStack {
                        VStack(alignment: .leading) {
                            Text(diceSet.context)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing])
                    .padding(.bottom, 40)
                    
                    /*
                     Session
                     */
                    NavigationLink {
                        SessionView(diceSet: diceSet)
                    } label: {
                        VStack {
                            Text("Ready to roll?")
                            Text("Start Session")
                                .font(.title)
                        }
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 20)
                        .background(.blue.gradient)
                        .cornerRadius(16)
                    }
                    .buttonStyle(.plain)
                    .padding([.leading, .trailing])
                    .accessibilityElement()
                    .accessibilityAddTraits(.isButton)
                    .padding(.bottom, 40)
                    
                    /*
                     Dice list
                     */
                    VStack {
                        HStack {
                            Text("Dice")
                                .font(.title)
                            Spacer()
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
                .navigationTitle(diceSet.name)
                .toolbar {
                    ToolbarItemGroup(placement: .topBarTrailing) {
                        NavigationLink("Edit") {
                            DiceSetEditView(diceSet: diceSet)
                        }
                    }
                }
            }
        }
    }
    
    init(diceSet: DiceSet) {
        self.diceSet = diceSet
    }

}

#Preview {
    NavigationStack {
        DiceSetDetailsView(diceSet: DiceSet.example)
    }
    .modelContainer(for: [
        Dice.self,
        DiceSet.self
    ], inMemory: true)
}
