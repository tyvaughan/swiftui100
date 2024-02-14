//
//  StringPractice.swift
//  P5_WordScramble
//
//  Created by  Ty Vaughan on 6/9/23.
//

import Foundation
import SwiftUI

func stringSplitOnSpaces() -> Void {
    let input = "a b c"
    let letters = input.components(separatedBy: " ") // splits the string by spaces
}

func stringSplitOnNewlines() -> Void {
    let input = """
                a
                b
                c
                """
    let letters = input.components(separatedBy: "\n") // splits the string by newline characters
    
    // Get a random element from the array
    let letter = letters.randomElement()
    
    // Remove all leading and trailing whitespace
    let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
}

func checkSpelling() -> Void {
    let word = "apple"
    
    // 1. Create the UITextChecker, the class we need to perform the spell checking
    let checker = UITextChecker()
    
    // 2. Specify how much of our string the checker should check
    let range = NSRange(location: 0, length: word.utf16.count)
    
    // 3. Specify where to report if found any misspellings
    let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
    
    // 4. B/c checker is an Objective-C class and doesn't have optionals, check for NSNotFound to see if no misspellings occurred
    let allGood = misspelledRange.location == NSNotFound
}
