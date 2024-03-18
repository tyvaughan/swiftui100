//
//  UserDetailsView.swift
//  M4_FriendFace_2024
//
//  Created by  Ty Vaughan on 3/18/24.
//

import SwiftUI

struct UserDetailsView: View {
    var user: User

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    ProfileIcon(user: user, showActive: false, size: 160)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
                    Spacer()
                }
                
                VStack(spacing: 4) {
                    Text(user.name)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .fontWeight(.bold)
                    HStack(spacing: 4) {
                        UserActiveLight(isActive: user.isActive, size: 10)
                        Text(user.isActive ? "Online" : "Offline")
                            .font(.caption)
                    }
                }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
                
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "building")
                            .frame(width: 24)
                        Text(user.company)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    HStack {
                        Image(systemName: "envelope")
                            .frame(width: 24)
                        Text(user.email)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
                
                VStack(alignment: .leading) {
                    Text("About")
                        .font(.headline)
                    Text(user.about)
                }
                
                Spacer()
            }
        }
        .padding()
    }
}

#Preview {
    NavigationStack {
        UserDetailsView(user: User.example)
    }
}
