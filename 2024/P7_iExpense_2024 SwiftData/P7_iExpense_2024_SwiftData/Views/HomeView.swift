//
//  HomeView.swift
//  P7_iExpense_2024
//
//  Created by  Ty Vaughan on 3/6/24.
//

import SwiftData
import SwiftUI

struct HomeView: View {
    @Environment(\.modelContext) var modelContext
    
    @Query(sort: \ExpenseItem.name) var items: [ExpenseItem]
    
    @State private var showingAddExpense = false
    
    @State private var types = ["Personal", "Business"]
    @State private var sortOrder = [
        SortDescriptor(\ExpenseItem.name)
    ]
    
    var body: some View {
        ExpenseItemList(types: types, sortOrder: sortOrder)
        .navigationTitle("iExpense")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Add expense", systemImage: "plus") {
                    showingAddExpense = true
                }
            }
            ToolbarItemGroup(placement: .topBarLeading) {
                Menu("Type", systemImage: "line.3.horizontal.decrease.circle") {
                    Picker("Type", selection: $types) {
                        Text("All")
                            .tag(["Personal", "Business"])
                        Text("Personal")
                            .tag(["Personal"])
                        Text("Business")
                            .tag(["Business"])
                    }
                }
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    Picker("Sort", selection: $sortOrder) {
                        Text("Sort by name")
                            .tag([
                                SortDescriptor(\ExpenseItem.name)
                            ])
                        Text("Sort by amount")
                            .tag([
                                SortDescriptor(\ExpenseItem.amount, order: .reverse)
                            ])
                    }
                }
            }
        }
        .sheet(isPresented: $showingAddExpense) {
            AddView()
        }
    }

}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let expenseItemContainer = try ModelContainer(for: ExpenseItem.self, configurations: config)
        return NavigationStack {
            HomeView()
                .modelContainer(expenseItemContainer)
        }
    } catch {
        return Text("Unable to load preview: \(error.localizedDescription)")
    }
}
