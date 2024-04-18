//
//  HomeView.swift
//  M6_DiceMaster_2024
//
//  Created by  Ty Vaughan on 4/4/24.
//

import SwiftData
import SwiftUI

struct HomeView: View {
    @Environment(\.modelContext) var modelContext
    @Query var diceSets: [DiceSet]
    
    @State private var isShowingDiceSetAddView: Bool = false
    @State private var newDiceSet: DiceSet? = nil
    
    var body: some View {
        NavigationStack {
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
    }
    
    func addDiceSet(diceSet: DiceSet) -> Void {
        modelContext.insert(diceSet)
        newDiceSet = nil
    }
    
    func deleteDiceSet(indexSet: IndexSet) -> Void {
        for index in indexSet {
            let diceSet = diceSets[index]
            modelContext.delete(diceSet)
        }
    }

}

#Preview {
    HomeView()
    .modelContainer(for: [
        Dice.self,
        DiceSet.self
    ], inMemory: true)
}
