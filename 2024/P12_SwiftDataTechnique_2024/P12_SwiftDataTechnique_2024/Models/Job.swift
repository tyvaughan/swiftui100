//
//  Job.swift
//  P12_SwiftDataTechnique_2024
//
//  Created by  Ty Vaughan on 3/16/24.
//

import Foundation
import SwiftData

@Model
class Job {
    var name: String = "None"
    var priority: Int = 1
    var owner: User?
    
    init(name: String, priority: Int, owner: User? = nil) {
        self.name = name
        self.priority = priority
        self.owner = owner
    }
}
