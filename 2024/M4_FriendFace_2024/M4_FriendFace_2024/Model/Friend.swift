//
//  Friend.swift
//  M4_FriendFace_2024
//
//  Created by  Ty Vaughan on 3/18/24.
//

import Foundation
import SwiftData

@Model
class Friend: Codable {
    var id: UUID
    let name: String

    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }

    // MARK: Codable conformance
    
    enum CodingKeys: CodingKey {
        case id
        case name
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
    }

}

// MARK: - Example
extension Friend {
    static let example: Friend = Friend(id: UUID(), name: "Apple Martini")
}
