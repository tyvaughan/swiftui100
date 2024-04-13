//
//  DiceResult.swift
//  M6_DiceMaster_2024
//
//  Created by  Ty Vaughan on 4/4/24.
//

import Foundation

class DiceResult: Codable, Identifiable {
    public var id: UUID = UUID()
    public let dice: Dice           // the die rolled
    public let result: String       // the result of the roll
    
    init(dice: Dice, result: String) {
        self.dice = dice
        self.result = result
    }

}

// MARK: - Example
extension DiceResult {
    static let example = DiceResult(
        dice: Dice.example.d6,
        result: Dice.example.d6.sides.randomElement()!
    )
}
