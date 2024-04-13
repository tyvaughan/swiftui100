//
//  DiceType.swift
//  M6_DiceMaster_2024
//
//  Created by  Ty Vaughan on 4/4/24.
//

import Foundation

/**
 Represents the size of a die.
 */
enum DiceType: Int, Codable {
    case d4 = 4
    case d6 = 6
    case d8 = 8
    case d10 = 10
    case d12 = 12
    case d20 = 20
}

// MARK: - +CaseIterable
extension DiceType: CaseIterable {
    static var allCases: [DiceType] {
        return [.d4, .d6, .d8, .d10, .d12, .d20]
    }
}
