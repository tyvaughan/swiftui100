//
//  UsersService.swift
//  M4_FriendFace_2024
//
//  Created by  Ty Vaughan on 3/18/24.
//

import Foundation
import SwiftData

class UsersService {
    
    func loadUsers() async -> [User] {
        let url: String = "https://www.hackingwithswift.com/samples/friendface.json"
        
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
            let decodedResponse = try decoder.decode([User].self, from: data)
            return decodedResponse
        } catch {
            print("Invalid data: \(error.localizedDescription)")
            return []
        }
    }
    
}
