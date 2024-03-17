//
//  User.swift
//  P12_SwiftDataTechnique_2024
//
//  Created by  Ty Vaughan on 3/16/24.
//

import Foundation
import SwiftData

@Model
class User {
    var name: String = "Anonymous"
    var city: String = "Unknown"
    var joinDate: Date = Date.now
    
    /*
     SwiftData will automatically load all Jobs linked to a user when the user is loaded!
     
     SwiftData can automatically figure out relationships. However, if we want to customize those relationships, we need something else...
     We use the @Relationship macro and specify '.cascade' so that if the user is deleted, the Job will be too
     */
    @Relationship(deleteRule: .cascade) var jobs: [Job]? = [Job]()
    var unwrappedJobs: [Job] {
        jobs ?? []
    }
    
    init(name: String, city: String, joinDate: Date) {
        self.name = name
        self.city = city
        self.joinDate = joinDate
    }

}
