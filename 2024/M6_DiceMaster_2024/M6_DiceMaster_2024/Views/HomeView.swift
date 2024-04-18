//
//  HomeView.swift
//  M6_DiceMaster_2024
//
//  Created by  Ty Vaughan on 4/4/24.
//

import SwiftUI

struct HomeView: View {
    @State public var diceSets: [DiceSet] = []
    
    @State private var isShowingDiceSetAddView: Bool = false
    @State private var newDiceSet: DiceSet? = nil
    
    var body: some View {
        List {
            ForEach(diceSets) { diceSet in
                NavigationLink {
                    DiceSetDetailsView(diceSet: diceSet)
                } label: {
                    Text(diceSet.name)
                }
            }
            .onDelete(perform: deleteDiceSet)
        }
        .navigationTitle("Dice Sets")
        .navigationDestination(isPresented: $isShowingDiceSetAddView) {
            if let newDiceSet = newDiceSet {
                DiceSetAddView(diceSet: newDiceSet, onSave: addDiceSet)
            }
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    newDiceSet = DiceSet(name: "New Dice Set", description: "", dice: [])
                    isShowingDiceSetAddView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
    
    func addDiceSet(diceSet: DiceSet) -> Void {
        diceSets.append(diceSet)
        newDiceSet = nil
    }
    
    func deleteDiceSet(indexSet: IndexSet) -> Void {
        diceSets.remove(atOffsets: indexSet)
    }

}

#Preview {
    NavigationStack {
        HomeView(
            diceSets: [
                DiceSet.example,
                DiceSet.example,
                DiceSet.example,
                DiceSet.example,
                DiceSet.example,
                DiceSet.example
            ]
        )
    }
}
