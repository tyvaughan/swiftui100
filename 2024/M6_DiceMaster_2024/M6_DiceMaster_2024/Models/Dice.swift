//
//  Dice.swift
//  M6_DiceMaster_2024
//
//  Created by  Ty Vaughan on 4/4/24.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class Dice: Codable, Identifiable {

    public var id: UUID = UUID()
    public var name: String
    public var type: DiceType
    public var sides: [String]
    public var dieColor: String
    public var valueColor: String
    
    // MARK: Initializers
    
    init(name: String, type: DiceType, sides: [String], dieColor: Color, valueColor: Color) {
        self.name = name
        self.type = type
        self.sides = sides
        self.dieColor = dieColor.toHex!
        self.valueColor = valueColor.toHex!
    }
    
    // MARK: SwiftData Codable support
    
    enum CodingKeys: CodingKey {
        case id
        case name
        case type
        case sides
        case dieColor
        case valueColor
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        type = try container.decode(DiceType.self, forKey: .type)
        sides = try container.decode([String].self, forKey: .sides)
        dieColor = try container.decode(String.self, forKey: .dieColor)
        valueColor = try container.decode(String.self, forKey: .valueColor)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(type, forKey: .type)
        try container.encode(sides, forKey: .sides)
        try container.encode(dieColor, forKey: .dieColor)
        try container.encode(valueColor, forKey: .valueColor)
    }
    
    // MARK: Methods

    /**
     Rolls the dice and fetches a result
     - Returns: the result of the roll
     */
    public func roll() -> String {
        return sides.randomElement()!
    }

}

// MARK: - +Hashable
extension Dice: Hashable {
    static func == (lhs: Dice, rhs: Dice) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}


// MARK: - Example
extension Dice {
    struct example {
        static var d4: Dice {
            Dice(
                name: "Standard 4-sided die",
                type: .d4,
                sides: Array(1...4).map { String($0) },
                dieColor: .white,
                valueColor: .black
            )
        }
        
        static var d6: Dice {
            Dice(
                name: "Standard 6-sided die",
                type: .d6,
                sides: Array(1...6).map { String($0) },
                dieColor: .white,
                valueColor: .black
            )
        }
        
        static var d8: Dice {
            Dice(
                name: "Standard 8-sided die",
                type: .d8,
                sides: Array(1...8).map { String($0) },
                dieColor: .white,
                valueColor: .black
            )
        }
    
        static var d10: Dice {
            Dice(
                name: "Standard 10-sided die",
                type: .d10,
                sides: Array(1...10).map { String($0) },
                dieColor: .white,
                valueColor: .black
            )
        }
    
        static var d12: Dice {
            Dice(
                name: "Standard 12-sided die",
                type: .d12,
                sides: Array(1...12).map { String($0) },
                dieColor: .white,
                valueColor: .black
            )
        }
    
        static var d20: Dice {
            Dice(
                name: "Standard 20-sided die",
                type: .d20,
                sides: Array(1...20).map { String($0) },
                dieColor: .white,
                valueColor: .black
            )
        }
    }
}
