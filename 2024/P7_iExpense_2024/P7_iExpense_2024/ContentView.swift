//
//  ContentView.swift
//  P7_iExpense_2024
//
//  Created by  Ty Vaughan on 3/3/24.
//

import SwiftUI

struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                Section("Personal") {
                    ForEach(expenses.items.filter({ $0.type == "Personal" })) { item in
                        HStack {
                            VStack (alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            Spacer()
                            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                .foregroundColor(getCurrencyColor(item.amount))
                        }
                    }
                    .onDelete { indexSet in
                        removeItems(at: indexSet, for: "Personal")
                    }
                }
                
                Section("Business") {
                    ForEach(expenses.items.filter({ $0.type == "Business" })) { item in
                        HStack {
                            VStack (alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            Spacer()
                            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                .foregroundColor(getCurrencyColor(item.amount))
                        }
                    }
                    .onDelete { indexSet in
                        removeItems(at: indexSet, for: "Business")
                    }
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add expense", systemImage: "plus") {
                    showingAddExpense = true
                }
            }
        }
        .sheet(isPresented: $showingAddExpense) {
            AddView(expenses: expenses)
        }
    }
    
    func getCurrencyColor(_ amount: Double) -> Color {
        if amount <= 10 {
            return .gray
        } else if amount <= 100 {
            return Color(red: 179 / 255, green: 154 / 255, blue: 0 / 255)
        } else {
            return .red
        }
    }
    
    func removeItems(at offsets: IndexSet, for type: String) {
        let typeOffset = getTypeOffset(for: type)
        let newOffsets = IndexSet(offsets.map { offset in
            offset + typeOffset
        })
        expenses.items.remove(atOffsets: newOffsets)
    }
    
    func getTypeOffset(for type: String) -> Int {
        if type == "Personal" {
            return 0
        } else if type == "Business" {
            let personalCount = expenses.items.filter { item in
                item.type == "Personal"
            }.count
            return personalCount
        }
        return 0
    }

}

#Preview {
    ContentView()
}
