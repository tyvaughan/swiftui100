//
//  File.swift
//  P8_Moonshot_2024
//
//  Created by  Ty Vaughan on 3/5/24.
//

import Foundation

class MoonshotUtils {
    
    static func getCrewMembers(for mission: Mission, from astronauts: [String: Astronaut]) -> [MissionView.CrewMember] {
        let crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return MissionView.CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
        return crew
    }
}
