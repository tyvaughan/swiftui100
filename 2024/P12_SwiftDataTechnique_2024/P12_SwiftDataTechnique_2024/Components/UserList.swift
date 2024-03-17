//
//  UserList.swift
//  P12_SwiftDataTechnique_2024
//
//  Created by  Ty Vaughan on 3/16/24.
//

import SwiftData
import SwiftUI

struct UserList: View {
    @Query var users: [User]
    
    var body: some View {
        List(users) { user in
            NavigationLink(value: user) {
                HStack {
                    Text(user.name)
                    Spacer()
                    Text(String(user.unwrappedJobs.count))
                        .fontWeight(.black)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(.blue)
                        .foregroundStyle(.white)
                        .clipShape(.capsule)
                }
            }
        }
    }
    
    init(minimumJoinDate: Date, sortOrder: [SortDescriptor<User>]) {
        // The underscore gives us access to the query that populates users
        _users = Query(filter: #Predicate<User> { user in
            user.joinDate >= minimumJoinDate
        }, sort: sortOrder)
    }
}

#Preview {
    NavigationStack {
        UserList(minimumJoinDate: .distantPast, sortOrder: [])
            .modelContainer(for: User.self)
    }
}
