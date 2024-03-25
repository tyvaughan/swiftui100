//
//  WriteDataToDocument.swift
//  P14_BucketList_2024
//
//  Created by  Ty Vaughan on 3/22/24.
//

import SwiftUI

struct WriteDataToDocument: View {
    
    var body: some View {
        Button("Press me", action: writeToFile)
    }
    
    func writeToFile() -> Void {
        let user = User(firstName: "Taylor", lastName: "Swift")
        let data = try! Data(JSONEncoder().encode(user))
        let url = URL.documentsDirectory.appending(path: "user.json")
        
        do {
            // Write data
            try data.write(to: url, options: [.atomic, .completeFileProtection])

            // Read the written data
            let decodedUser: User = FileManager.default.decode("user.json")
            print(decodedUser)
        } catch {
            print(error.localizedDescription)
        }
    }

    struct User: Codable, Comparable, Identifiable {
        var id = UUID()
        var firstName: String
        var lastName: String
        
        // MARK: Comparable conformance
        static func <(lhs: User, rhs: User) -> Bool {
            lhs.lastName < rhs.lastName
        }
        
        static func >(lhs: User, rhs: User) -> Bool {
            lhs.lastName > rhs.lastName
        }
    }

}


#Preview {
    WriteDataToDocument()
}
