//
//  ConformToComparable.swift
//  P14_BucketList_2024
//
//  Created by  Ty Vaughan on 3/22/24.
//

import SwiftUI

struct ConformToComparable: View {
    let users = [
        User(firstName: "Arnold", lastName: "Rimmer"),
        User(firstName: "Kristine", lastName: "Kochanski"),
        User(firstName: "David", lastName: "Lister")
    ].sorted()

    var body: some View {
        List(users) { user in
            Text("\(user.firstName) \(user.lastName)")
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
    ConformToComparable()
}
