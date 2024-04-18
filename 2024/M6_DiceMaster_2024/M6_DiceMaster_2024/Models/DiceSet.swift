//
//  DiceSet.swift
//  M6_DiceMaster_2024
//
//  Created by  Ty Vaughan on 4/4/24.
//

import Foundation
import SwiftData

@Model
class DiceSet: Codable, Identifiable {
    public var id: UUID = UUID()
    public var name: String
    public var context: String
    @Relationship(deleteRule: .cascade) public var dice: [Dice]
    
    init(name: String, description: String, dice: [Dice]) {
        self.name = name
        self.context = description
        self.dice = dice
    }
    
    // MARK: SwiftData Codable support
    
    enum CodingKeys: CodingKey {
        case id
        case name
        case context
        case dice
    }
    
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        context = try container.decode(String.self, forKey: .context)
        dice = try container.decode([Dice].self, forKey: .dice)
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(context, forKey: .context)
        try container.encode(dice, forKey: .dice)
    }
    
    // MARK: methods

    /**
     Adds a die to the set of dice.
     - Parameter die: the new die to add to the set
     */
    func add(die: Dice) -> Void {
        dice.append(die)
    }
    
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
    static var example: DiceSet {
        return DiceSet(
            name: "D&D Dice Set",
            description: "These dice are used to play D&D. These dice are used to play D&D. These dice are used to play D&D. These dice are used to play D&D. These dice are used to play D&D. These dice are used to play D&D. These dice are used to play D&D. These dice are used to play D&D.",
            dice: []
        )
    }
}
