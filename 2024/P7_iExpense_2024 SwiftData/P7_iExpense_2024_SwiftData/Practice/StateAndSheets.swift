//
//  Practice.swift
//  P7_iExpense_2024
//
//  Created by  Ty Vaughan on 3/3/24.
//

import Observation
import SwiftUI

/*
 When we use a Struct, whenever a struct's property changes, the instance of the struct is recreated with the new property values. With a struct as @State, SwiftUI sees this property changes and reloads the view.
 
 With classes as @State, the instance of the class doesn't change, so SwiftUI won't reload the view.
 
 The Observable macro tells SwiftUI to watch each property inside the class for changes, and to reload any view that relies on a property when it changes.
 */

@Observable
class User {
    var firstName = "Bilbo"
    var lastName = "Baggins"
}

struct StateAndSheets: View {
    
    @State private var user = User()
    
    @State private var showingSheet = false
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName)")
            TextField("First name", text: $user.firstName)
                .textFieldStyle(.roundedBorder)
                .frame(width: 200)
            TextField("Last name", text: $user.lastName)
                .textFieldStyle(.roundedBorder)
                .frame(width: 200)
        }
        
        Button("Show sheet") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            SecondView(name: "Ty")
        }
    }
}

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    
    let name: String
    
    var body: some View {
        Text("Hello, \(name)!")
        Button("Dismiss") {
            dismiss()
        }
    }
}

#Preview {
    StateAndSheets()
}
