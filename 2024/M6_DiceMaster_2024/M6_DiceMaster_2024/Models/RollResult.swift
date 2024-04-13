//
//  RollResult.swift
//  M6_DiceMaster_2024
//
//  Created by  Ty Vaughan on 4/4/24.
//

import Foundation

class RollResult: Codable, Identifiable {
    public var id: UUID = UUID()
    public let results: [DiceResult]    // the set of dice used in the roll
    public let date: Date               // the time when rolled

    init(results: [DiceResult], date: Date) {
        self.results = results
        self.date = date
    }

}

// MARK: - Example
extension RollResult {
    static let example = RollResult(
        results: [DiceResult.example, DiceResult.example, DiceResult.example],
        date: Date.now
    )
}
