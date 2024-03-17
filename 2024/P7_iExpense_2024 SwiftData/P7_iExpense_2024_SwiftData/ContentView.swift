//
//  ContentView.swift
//  P7_iExpense_2024
//
//  Created by  Ty Vaughan on 3/3/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            HomeView()
        }
    }

}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let expenseItemContainer = try ModelContainer(for: ExpenseItem.self, configurations: config)
        return ContentView()
            .modelContainer(expenseItemContainer)
    } catch {
        return Text("Unable to load preview: \(error.localizedDescription)")
    }
}
