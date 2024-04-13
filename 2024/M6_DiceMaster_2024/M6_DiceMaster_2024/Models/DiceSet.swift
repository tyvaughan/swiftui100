//
//  DiceSet.swift
//  M6_DiceMaster_2024
//
//  Created by  Ty Vaughan on 4/4/24.
//

import Foundation

class DiceSet: Codable, Identifiable {
    public var id: UUID = UUID()
    public var name: String
    public var description: String
    public var dice: [Dice]
    
    init(name: String, description: String, dice: [Dice]) {
        self.name = name
        self.description = description
        self.dice = dice
    }

    /**
     Adds a die to the set of dice.
     - Parameter die: the new die to add to the set
     */
    func add(die: Dice) -> Void {
        dice.append(die)
    }
    
//    /**
//     Updates a die in the current dice set
//     - Parameter die: the dice to be updated
//     */
//    func edit(die: Dice) -> Void {
//        if let index = dice.firstIndex(where: { d in d.id == die.id }) {
//            dice[index] = die
//        }
//    }
    
    /**
     Removes a die from the set of dice
     - Parameter die: the die to be removed from the set
     */
    func remove(die: Dice) -> Void {
        dice.removeAll { d in
            d.id == die.id
        }
    }
}

// MARK: - Example
extension DiceSet {
    static let example = DiceSet(
        name: "D&D Dice Set",
        description: "These dice are used to play D&D. These dice are used to play D&D. These dice are used to play D&D. These dice are used to play D&D. These dice are used to play D&D. These dice are used to play D&D. These dice are used to play D&D. These dice are used to play D&D.",
        dice: [Dice.example.d4, Dice.example.d6, Dice.example.d8, Dice.example.d10, Dice.example.d12, Dice.example.d20]
    )
}
