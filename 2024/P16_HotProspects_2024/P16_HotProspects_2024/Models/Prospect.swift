//
//  Prospect.swift
//  P16_HotProspects_2024
//
//  Created by  Ty Vaughan on 4/1/24.
//

import Foundation
import SwiftData

@Model
class Prospect {
    var name: String
    var emailAddress: String
    var isContacted: Bool
    var dateAdded: Date
    
    init(name: String, emailAddress: String, isContacted: Bool) {
        self.name = name
        self.emailAddress = emailAddress
        self.isContacted = isContacted
        self.dateAdded = Date()
    }

}

// MARK: - Example
extension Prospect {

    static let example = Prospect(name: "Taylor Swift", emailAddress: "taylor@swift.com", isContacted: false)

}
