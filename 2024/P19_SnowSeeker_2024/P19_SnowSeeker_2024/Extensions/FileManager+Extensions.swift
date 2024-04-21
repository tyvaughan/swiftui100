//
//  FileManager+Extensions.swift
//  P19_SnowSeeker_2024
//
//  Created by  Ty Vaughan on 4/21/24.
//

import Foundation

extension FileManager {
    
    func decode<T: Codable>(_ file: String, isFatal: Bool = true) -> T? {
        guard let documentUrl = self.urls(for: .documentDirectory, in: .userDomainMask).first else {
            if isFatal { fatalError("Failed to locate \(file) in the documents directory.") }
            else { return nil }
        }
        
        let fileUrl = documentUrl.appendingPathComponent(file)
        guard let data = try? Data(contentsOf: fileUrl) else {
            if isFatal { fatalError("Failed to load \(file) from the documents directory.") }
            else { return nil }
        }
        
        let decoder = JSONDecoder()
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            if isFatal { fatalError("Failed to decode \(file) from the documents directory.") }
            else { return nil }
        }

        return loaded
    }
    
    func encode<T: Codable>(_ file: String, data: T) -> Void {
        let documentUrl = URL.documentsDirectory.appending(path: file)
        print(documentUrl.absoluteString)
        do {
            let encodedData = try JSONEncoder().encode(data)
            try encodedData.write(to: documentUrl, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save data to file: \(file)")
        }
    }
    
}
