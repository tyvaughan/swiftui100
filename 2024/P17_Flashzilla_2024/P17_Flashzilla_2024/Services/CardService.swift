//
//  CardService.swift
//  P17_Flashzilla_2024
//
//  Created by  Ty Vaughan on 4/3/24.
//

import Foundation

class CardService {
    
    static private var file = URL.documentsDirectory.appending(path: "cards.json")
    
    /**
     Loads saved cards from memory.
     - Returns: the cards that were saved
     */
    static public func load() -> [Card] {
        if let data = try? Data(contentsOf: file) {
            if let cards = try? JSONDecoder().decode([Card].self, from: data) {
                return cards
            }
        }
        return []
    }
    
    /**
     Saves the provided array of cards into memory, overwriting the previously saved list of cards.
     - Parameter cards: the new list of cards to save
     */
    static public func save(cards: [Card]) -> Void {
        do {
            let data = try JSONEncoder().encode(cards)
            try data.write(to: file, options: [.atomic, .completeFileProtection])
        } catch {
            print("Failed to save cards: \(error.localizedDescription)")
        }
    }
    
}
