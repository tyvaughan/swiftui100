//
//  Session.swift
//  M6_DiceMaster_2024
//
//  Created by  Ty Vaughan on 4/4/24.
//

import Foundation

class Session: Codable, Identifiable {
    public var id: UUID = UUID()
    public let diceSet: DiceSet         // Dice Set that the session is for
    public var results: [RollResult]    // Results from rolling the dice
    
    init(diceSet: DiceSet) {
        self.diceSet = diceSet
        self.results = []
    }

    /**
     Adds a roll's result to the session.
     - Parameter result: the result from rolling one or more dice
     */
    func addRollResult(result: RollResult) -> Void {
        results.append(result)
    }

}

// MARK: - Example
extension Session {
    static let example = Session(
        diceSet: DiceSet.example
    )
}
