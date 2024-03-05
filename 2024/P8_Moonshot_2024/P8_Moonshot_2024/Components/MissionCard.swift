//
//  MissionCard.swift
//  P8_Moonshot_2024
//
//  Created by  Ty Vaughan on 3/5/24.
//

import SwiftUI

struct MissionCard: View {
    let mission: Mission

    var body: some View {
        VStack {
            Image(mission.image)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding()
            
            VStack {
                Text(mission.displayName)
                    .font(.headline)
                    .foregroundStyle(.white)
                Text(mission.formattedLaunchDate)
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.5))
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .background(.lightBackground)
        }
        .clipShape(.rect(cornerRadius: 10))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.lightBackground)
        )
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    return MissionCard(mission: missions[0])
        .preferredColorScheme(.dark)
}
