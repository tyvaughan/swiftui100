//
//  SelectItemsInAList.swift
//  P16_HotProspects_2024
//
//  Created by  Ty Vaughan on 4/1/24.
//

import SwiftUI

struct SelectItemsInAList: View {
    
    /*
     To handle a selection, we need to store an optional value that matches the data type of the list of items in the list
     */
    @State private var selection: String?
    
    /*
     If we want to handle multi-select, we need to update the value to store a Set of values
     */
    @State private var selections = Set<String>()
    
    let users = ["Tohru", "Yuki", "Kyo", "Momiji"]
    
    var body: some View {
        List(users, id: \.self, selection: $selections) { user in
            Text(user)
        }
        .toolbar {
            /*
             We can use an EditButton to toggle to the environment edit state.
             
             Doing so will set the list to automatically enable and multi-select
             */
            EditButton()
        }
        
        /*
         We can then use that value to conditionally render different content in our view
         */
        if let selection {
            Text("You selected \(selection)")
        }
        if selections.isEmpty == false {
            Text("You selected \(selections.formatted())")
        }
    }
}

#Preview {
    NavigationStack {
        SelectItemsInAList()
    }
}
