//
//  ArchivingObjectsWithCodable.swift
//  P7_iExpense_2024
//
//  Created by  Ty Vaughan on 3/3/24.
//

import SwiftUI

/*
 When storing structs or complex data types in UserDefaults, we need to use UserDefaults instead of going through the AppStorage property wrapper.
 */

/*
 Codable means that a data type can be transformed between the object and a string.
 
 When the object only has simple property types - strings, integers, Booleans, arrays of strings, etc. - we can simply conform to the Codable protocol.
 */

struct Artist: Codable {
    let firstName: String
    let lastName: String
}

struct ArchivingObjectsWithCodable: View {
    @State private var user = Artist(firstName: "Taylor", lastName: "Swift")

    var body: some View {
        Text("Hello, \(user.firstName) \(user.lastName)!")
        Button("Save user", action: saveUser)
    }
    
    func saveUser() {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(user) {
            UserDefaults.standard.set(data, forKey: "UserData")
        }
    }
}

#Preview {
    ArchivingObjectsWithCodable()
}
