//
//  HomeView.swift
//  M4_FriendFace_2024
//
//  Created by  Ty Vaughan on 3/18/24.
//

import SwiftData
import SwiftUI

struct UsersView: View {
    @Query(sort: \User.name) var users: [User]

    var body: some View {
        List {
            Section {
                ForEach(users) { user in
                    UserCard(user: user)
                        .listRowSeparator(.hidden)
                        .listRowInsets(.none)
                        .background(
                            NavigationLink("Link to user details", destination: UserDetailsView(user: user))
                                .opacity(0)
                        )
                }
            }
        }
        .listStyle(.plain)
        .navigationTitle("Users")
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: User.self, configurations: config)
        return NavigationStack {
            UsersView()
                .modelContainer(container)
        }
    } catch {
        return Text("Failed to create container: \(error.localizedDescription)")
    }
}
