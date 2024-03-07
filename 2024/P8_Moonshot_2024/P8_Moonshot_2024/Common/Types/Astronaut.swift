//
//  Astronaut.swift
//  P8_Moonshot_2024
//
//  Created by  Ty Vaughan on 3/5/24.
//

import Foundation

struct Astronaut: Codable, Identifiable, Hashable, Equatable {
    let id: String
    let name: String
    let description: String
}
