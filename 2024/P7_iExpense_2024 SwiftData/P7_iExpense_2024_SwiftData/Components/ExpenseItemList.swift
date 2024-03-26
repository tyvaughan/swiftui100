//
//  ExpenseItemList.swift
//  P7_iExpense_2024
//
//  Created by  Ty Vaughan on 3/16/24.
//

import SwiftData
import SwiftUI

struct ExpenseItemList: View {
    @Environment(\.modelContext) var modelContext
    @Query var items: [ExpenseItem]
    
    var body: some View {
        List {
            ForEach(items) { item in
                HStack {
                    VStack (alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        Text(item.type)
                    }
                    Spacer()
                    Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .foregroundColor(item.amountColor)
                }
                .accessibilityElement()
                .accessibilityLabel("\(item.name), \(getCurrencyLabel(for: item.amount))")
                .accessibilityHint("\(item.type) expense")
            }
            .onDelete(perform: removeItems)
        }
    }
    
    init(types: [String], sortOrder: [SortDescriptor<ExpenseItem>]) {
        _items = Query(filter: #Predicate<ExpenseItem> { item in
            types.contains(item.type)
        }, sort: sortOrder)
    }
    
    func removeItems(at indexSet: IndexSet) {
        for index in indexSet {
            modelContext.delete(items[index])
        }
    }
    
    func getCurrencyLabel(for amount: Double) -> String {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        return formatter.string(from: NSNumber(value: amount))!
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let expenseItemContainer = try ModelContainer(for: ExpenseItem.self, configurations: config)
        return NavigationStack {
            ExpenseItemList(types: ["Personal"], sortOrder: [])
                .modelContainer(expenseItemContainer)
        }
    } catch {
        return Text("Unable to load preview: \(error.localizedDescription)")
    }
}
