//
//  Card.swift
//  P17_Flashzilla_2024
//
//  Created by  Ty Vaughan on 4/2/24.
//

import Foundation

struct Card: Codable, Identifiable, Hashable {
    var id: UUID = UUID()
    var prompt: String
    var answer: String
}

// MARK: Example
extension Card {
    static let example = Card(
        prompt: "Who played the 13th Doctor in Doctor Who?",
        answer: "Jodie Whittaker"
    )
}
