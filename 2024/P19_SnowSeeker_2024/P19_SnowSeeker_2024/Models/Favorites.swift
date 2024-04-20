//
//  Favorites.swift
//  P19_SnowSeeker_2024
//
//  Created by  Ty Vaughan on 4/20/24.
//

import Foundation
import SwiftUI

@Observable
class Favorites {
    private var resorts: Set<String>
    
    private let key = "Favorites"
    
    init() {
        // load our saved data
        
        // still here? Use an empty array
        resorts = []
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
    
    func save() {
        // write out our data
    }
    
}
