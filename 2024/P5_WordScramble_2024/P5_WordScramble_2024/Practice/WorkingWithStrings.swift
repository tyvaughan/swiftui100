//
//  WorkingWithStrings.swift
//  P5_WordScramble_2024
//
//  Created by  Ty Vaughan on 2/25/24.
//

import Foundation
import SwiftUI

func splitStrings() {
    var input = "a b c"
    var letters = input.components(separatedBy: " ")
    
    input = """
                a
                b
                c
                """
    letters = input.components(separatedBy: "\n")
}

func trimStrings() {
    var input = "a b c"
    var letters = input.components(separatedBy: " ")
    let letter = letters.randomElement()
    let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
}

func checkSpelling() {
    let word = "swift"
    let checker = UITextChecker()
    let range = NSRange(location: 0, length: word.utf16.count)
    let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
    let allGood = misspelledRange.location == NSNotFound
}
