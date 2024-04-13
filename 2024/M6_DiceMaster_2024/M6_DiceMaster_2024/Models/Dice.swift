//
//  Dice.swift
//  M6_DiceMaster_2024
//
//  Created by  Ty Vaughan on 4/4/24.
//

import Foundation
import SwiftUI

class Dice: Codable, Identifiable {
    public var id: UUID = UUID()
    public var name: String
    public var type: DiceType
    public var sides: [String]
    
//    public var dieColor: Color = .white
//    public var valueColor: Color = .black
    
    init(name: String, type: DiceType, sides: [String], dieColor: Color, fontColor: Color) {
        self.name = name
        self.type = type
        self.sides = sides
//        self.dieColor = dieColor
//        self.valueColor = valueColor
    }

    /**
     Rolls the dice and fetches a result
     - Returns: the result of the roll
     */
    public func roll() -> String {
        return sides.randomElement()!
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
                fontColor: .black
            )
        }
        
        static var d6: Dice {
            Dice(
                name: "Standard 6-sided die",
                type: .d6,
                sides: Array(1...6).map { String($0) },
                dieColor: .white,
                fontColor: .black
            )
        }
        
        static var d8: Dice {
            Dice(
                name: "Standard 8-sided die",
                type: .d8,
                sides: Array(1...8).map { String($0) },
                dieColor: .white,
                fontColor: .black
            )
        }
    
        static var d10: Dice {
            Dice(
                name: "Standard 10-sided die",
                type: .d10,
                sides: Array(1...10).map { String($0) },
                dieColor: .white,
                fontColor: .black
            )
        }
    
        static var d12: Dice {
            Dice(
                name: "Standard 12-sided die",
                type: .d12,
                sides: Array(1...12).map { String($0) },
                dieColor: .white,
                fontColor: .black
            )
        }
    
        static var d20: Dice {
            Dice(
                name: "Standard 20-sided die",
                type: .d20,
                sides: Array(1...20).map { String($0) },
                dieColor: .white,
                fontColor: .black
            )
        }
    }
}
