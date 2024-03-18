//
//  HomeView.swift
//  M4_FriendFace_2024
//
//  Created by  Ty Vaughan on 3/18/24.
//

import SwiftUI

struct UsersView: View {
    @Binding var users: [User]

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
    NavigationStack {
        UsersView(users: .constant([User.example, User.example, User.example]))
    }
}
