//
//  User.swift
//  M4_FriendFace_2024
//
//  Created by  Ty Vaughan on 3/18/24.
//

import Foundation
import SwiftData

struct User: Codable, Hashable, Identifiable {
    var id: UUID
    let name: String
    let email: String
    let age: Int
    let about: String
    let address: String
    let company: String
    let registered: Date
    let tags: [String]
    let friends: [Friend]
    let isActive: Bool
    
    init(id: UUID, name: String, email: String, age: Int, about: String, address: String, company: String, registered: Date, tags: [String], friends: [Friend], isActive: Bool) {
        self.id = id
        self.name = name
        self.email = email
        self.age = age
        self.about = about
        self.address = address
        self.company = company
        self.registered = registered
        self.tags = tags
        self.friends = friends
        self.isActive = isActive
    }
    
    // MARK: Codable conformance
    
//    enum CodingKeys: String, CodingKey {
//        case id
//        case name
//        case email
//        case age
//        case about
//        case address
//        case company
//        case registered
//        case tags
//        case friends
//        case isActive
//    }
//    
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.id = try container.decode(UUID.self, forKey: .id)
//        self.name = try container.decode(String.self, forKey: .name)
//        self.email = try container.decode(String.self, forKey: .email)
//        self.age = try container.decode(Int.self, forKey: .age)
//        self.about = try container.decode(String.self, forKey: .about)
//        self.address = try container.decode(String.self, forKey: .address)
//        self.company = try container.decode(String.self, forKey: .company)
//        self.registered = try container.decode(Date.self, forKey: .registered)
//        self.tags = try container.decode([String].self, forKey: .tags)
//        self.friends = try container.decode([Friend].self, forKey: .friends)
//        self.isActive = try container.decode(Bool.self, forKey: .isActive)
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(self.id, forKey: .id)
//        try container.encode(self.name, forKey: .name)
//        try container.encode(self.email, forKey: .id)
//        try container.encode(self.age, forKey: .age)
//        try container.encode(self.about, forKey: .about)
//        try container.encode(self.address, forKey: .address)
//        try container.encode(self.company, forKey: .company)
//        try container.encode(self.registered, forKey: .registered)
//        try container.encode(self.tags, forKey: .tags)
//        try container.encode(self.friends, forKey: .friends)
//        try container.encode(self.isActive, forKey: .isActive)
//    }

}

// MARK: - Example
extension User {
    static let example: User = User(
        id: UUID(),
        name: "Espresso Martini",
        email: "espresso@martini.com",
        age: 33,
        about: "Live everyday with a shot of espresso",
        address: "1234 Barista Street, Atlanta, Georgia, 30024",
        company: "Espresso Co.",
        registered: Calendar.current.date(byAdding: .year, value: -5, to: Date()) ?? Date(),
        tags: ["ipsum", "lorem"],
        friends: [Friend.example],
        isActive: true
    )
}
