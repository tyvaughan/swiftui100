//
//  UserCard.swift
//  M4_FriendFace_2024
//
//  Created by  Ty Vaughan on 3/18/24.
//

import SwiftUI

struct UserCard: View {
    var user: User
    
    var body: some View {
        HStack {
            VStack {
                ProfileIcon(user: user, showActive: true)
                Spacer()
            }
            .frame(maxHeight: .infinity)
            VStack(alignment: .leading) {
                Text(user.name)
                    .fontWeight(.bold)
                Text(user.company)
                    .font(.system(size: 14))
                    .foregroundStyle(.secondary)
                Text(user.email)
                    .font(.system(size: 14))
                    .foregroundStyle(.secondary)
            }
            Spacer()
        }
        .fixedSize(horizontal: false, vertical: true)
        .padding(20)
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(.black, lineWidth: 1)
        )
    }

}


#Preview {
    UserCard(user: User.example)
}
