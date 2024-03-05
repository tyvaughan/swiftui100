//
//  AstronautScroller.swift
//  P8_Moonshot_2024
//
//  Created by  Ty Vaughan on 3/5/24.
//

import SwiftUI

struct CrewScroller: View {
    let crew: [MissionView.CrewMember]
    
    var body: some View {
        VStack {
            Text("Crew")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title.bold())
                .padding(.bottom, 5)
        }
        .padding(.horizontal)
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(.capsule)
                                .overlay(
                                    Capsule()
                                        .strokeBorder(.white, lineWidth: 1)
                                )
                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .foregroundStyle(.white)
                                    .font(.headline)
                                Text(crewMember.role)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let crewMembers = MoonshotUtils.getCrewMembers(for: missions[0], from: astronauts)
    return CrewScroller(crew: crewMembers)
        .preferredColorScheme(.dark)
}
