//
//  ExpenseItem.swift
//  P7_iExpense_2024
//
//  Created by  Ty Vaughan on 3/3/24.
//

import Foundation
import SwiftData
import SwiftUI


@Model
class ExpenseItem: Identifiable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
    
    init(id: UUID = UUID(), name: String, type: String, amount: Double) {
        self.id = id
        self.name = name
        self.type = type
        self.amount = amount
    }
    
    var amountColor: Color {
        if amount <= 10 {
            return .gray
        } else if amount <= 100 {
            return Color(red: 179 / 255, green: 154 / 255, blue: 0 / 255)
        } else {
            return .red
        }
    }
    
    static func predicate(types: [String]) -> Predicate<ExpenseItem> {
        return #Predicate<ExpenseItem> { item in
            types.contains(item.type)
        }
    }
}
