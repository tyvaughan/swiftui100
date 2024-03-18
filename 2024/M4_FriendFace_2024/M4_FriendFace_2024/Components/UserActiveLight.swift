//
//  UserActiveLight.swift
//  M4_FriendFace_2024
//
//  Created by  Ty Vaughan on 3/18/24.
//

import SwiftUI

struct UserActiveLight: View {
    var isActive: Bool
    var size: CGFloat = 12

    var body: some View {
        Circle()
            .foregroundColor(isActive ? .green : .gray)
            .frame(width: size, height: size)
            .background(
                Circle()
                    .foregroundColor(isActive ? .green : .gray)
                    .opacity(0.5)
                    .frame(width: size * 1.33, height: size * 1.33)
            )
    }
}

#Preview {
    UserActiveLight(isActive: true, size: 12)
}
