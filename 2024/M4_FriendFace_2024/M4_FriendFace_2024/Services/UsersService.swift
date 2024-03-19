//
//  UsersService.swift
//  M4_FriendFace_2024
//
//  Created by  Ty Vaughan on 3/18/24.
//

import Foundation
import SwiftData

class UsersService {
    
    func loadUsers(modelContext: ModelContext?) async -> [User] {
        let url: String = "https://www.hackingwithswift.com/samples/friendface.json"
        var users: [User] = []
        
        // Create the URL
        guard let url = URL(string: url) else {
            print("Invalid URL")
            return []
        }
        
        do {
            // Fetch data from the URL
            guard let (data, _) = try? await URLSession.shared.data(from: url) else {
                print("Request failed")
                return []
            }
            
            // Decode the data
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            users = try decoder.decode([User].self, from: data)
        } catch {
            print("Invalid data: \(error.localizedDescription)")
            return []
        }
        
        // If a model context was provided, save the users
        guard let modelContext = modelContext else {
            return users;
        }

        do {
            let batchSize = 100
            let totalObjects = users.count
            for i in 0..<(totalObjects / batchSize) {
                for j in 0..<batchSize {
                    let index = i * batchSize + j
                    modelContext.insert(users[index])
                }
                try modelContext.save()
            }
        } catch {
            print("Failed to save data")
        }
        
        return users;
    }
    
}
