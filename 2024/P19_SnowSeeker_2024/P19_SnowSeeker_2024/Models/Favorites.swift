//
//  Favorites.swift
//  P19_SnowSeeker_2024
//
//  Created by  Ty Vaughan on 4/20/24.
//

import Foundation
import SwiftUI

@Observable
class Favorites: Codable {
    private var resorts: Set<String>
    
    init() {
        resorts = []
        resorts = load()
    }
    
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }
    
    func add(_ resort: Resort) {
        resorts.insert(resort.id)
        save()
    }
    
    func remove(_ resort: Resort) {
        resorts.remove(resort.id)
        save()
    }
    
    // MARK: Persistence methods
    
    private func load() -> Set<String> {
        if let savedData: [String] = FileManager().decode(K.favoritesFile, isFatal: false) {
            return Set(savedData)
        } else {
            return []
        }
    }
    
    private func save() {
        FileManager().encode(K.favoritesFile, data: resorts)
    }
    
}
