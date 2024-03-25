//
//  FileManager+Extensions.swift
//  P14_BucketList_2024
//
//  Created by  Ty Vaughan on 3/22/24.
//

import Foundation

// MARK: - FileManager extension
extension FileManager {

    func decode<T: Codable>(_ file: String) -> T {
        guard let documentsUrl = self.urls(for: .documentDirectory, in: .userDomainMask).first else {
            fatalError("Failed to locate \(file) in the documents directory.")
        }
        
        let fileUrl = documentsUrl.appendingPathComponent(file)
        guard let data = try? Data(contentsOf: fileUrl) else {
            fatalError("Failed to load \(file) from the documents directory.")
        }
        
        let decoder = JSONDecoder()
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from the documents directory.")
        }

        return loaded
    }
    
}
