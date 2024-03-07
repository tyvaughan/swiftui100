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
        HomeView()
    }

}

#Preview {
    ContentView()
}
