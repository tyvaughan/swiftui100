//
//  SwiftDataIntro.swift
//  P11_Bookworm_2024
//
//  Created by  Ty Vaughan on 3/13/24.
//

import SwiftData
import SwiftUI

/*
 We need to define the data structure for storing student data
 
 The @Model macro builds on top of the @Observable macro!
 */
@Model
class Student {
    var id: UUID
    var name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}

// Mark: - Example App File

//
//import Foundation
//import SwiftData
//import SwiftUI
//
//@main // This tells Swift that this is what launches our app
//struct BookwormApp: App {
//    var body: some Scene {
//        WindowGroup { // This allow the app to run in multiple windows
//            ContentView()
//        }
//        .modelContainer(for: Student.self)
//    }
//}


struct SwiftDataIntro: View {
    @Environment(\.modelContext) var modelContext
    @Query var students: [Student]
    
    var body: some View {
        List(students) { student in
            Text(student.name)
        }
        .navigationTitle("Classroom")
        .toolbar {
            Button("Add") {
                let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]

                let chosenFirstName = firstNames.randomElement()!
                let chosenLastName = lastNames.randomElement()!
                
                // Create the object
                let student = Student(id: UUID(), name: "\(chosenFirstName) \(chosenLastName)")
                
                // Save the object
                modelContext.insert(student)
            }
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Student.self, configurations: config)
    
    return NavigationStack {
        SwiftDataIntro()
            .modelContainer(container)
    }
}
