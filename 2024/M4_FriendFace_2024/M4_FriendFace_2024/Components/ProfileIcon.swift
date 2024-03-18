//
//  ProfileIcon.swift
//  M4_FriendFace_2024
//
//  Created by  Ty Vaughan on 3/18/24.
//

import SwiftUI

struct ProfileIcon: View {
    var user: User

    var showActive: Bool = false
    var size: CGFloat = 40

    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.blue)
                .frame(width: size, height: size)
            if showActive {
                VStack(alignment: .trailing) {
                    Spacer()
                    HStack {
                        Spacer()
                        UserActiveLight(isActive: user.isActive, size: size / 3.3)
                    }
                }
                .frame(width: size, height: size)
            }
        }
    }
}

#Preview {
    ProfileIcon(user: User.example, showActive: true, size: 40)
}
