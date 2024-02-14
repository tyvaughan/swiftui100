//
//  Day16.swift
//  WeSplit
//
//  Created by  Ty Vaughan on 5/30/23.
//

import Foundation
import SwiftUI

struct Day16View: View {
    let students = ["Harry", "Hermione", "Ron"]
    let studentDups = ["Harry", "Harry", "Hermione", "Ron"]
    
    /*
     B/c a View is a struct, we can't modify state, and we can't use 'mutating' on a computed property, such as the body property.
     To get around this, SwiftUI gives us the 'State' property wrapper
     */
    @State private var tapCount = 0
    @State private var name = ""
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                    
                }
                Section {
                    Button("Tap Count \(tapCount)") {
                        self.tapCount += 1 // Use 'self' to make it visually obvious we're modifying state
                    }
                }
                Section {
                    TextField("Enter your name", text: $name) // Use the '$' prefix to denote a two-way binding so that the child view can both update the parent view's state and read the value as it changes
                    Text("Your name is: \(name)") // Here we don't need a two-way binding, since we're only reading the value and not modifying it
                }
                Picker("Select your student", selection: $selectedStudent) {
                    // ForEach isn't hit by the 10-child limit
                    
                    /*
                     '\.self' is important. SwiftUI requires all views to be able to uniquely identify themselves for rendering purposes. If we looped through a list of structs or other data structures, they may have an attribute like an ID field that is unique. Here, since each element of our array is unique, we can use the value of the array itself by passing in \.self
                     */
                    ForEach(students, id: \.self) {
                        Text($0) // We can use Swift's closure variables
                    }
                }
                Picker("Select your student duplicate", selection: $selectedStudent) {
                    ForEach(Array(studentDups.enumerated()), id: \.element) { index, element in
                        Text(element)
                    }
                }
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
        }
        
        /*
         Modifiers like '.padding()' return the original view + the modifications specified
         */
        
        /*
         All SwiftUI components can only have up to 10 children components. If you wish to have more than 10, you can group them in child components, such as a Group
         
         Groups don't change the way your interface looks, they simply let us work around the 10 child component limitation
         
         If we want the groups to be visually distinguished, we can use Sections
         */
    }
}

struct Day16View_Previews: PreviewProvider {
    static var previews: some View {
        Day16View()
    }
}
