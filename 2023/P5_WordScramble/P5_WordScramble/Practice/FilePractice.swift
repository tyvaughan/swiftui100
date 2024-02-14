//
//  FilePractice.swift
//  P5_WordScramble
//
//  Created by  Ty Vaughan on 6/9/23.
//

import Foundation

func fetchFile(named file: String) -> String {
    
    // Find the file...
    if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
        // we found our file!
        
        // Load the file into a string...
        if let fileContents = try? String(contentsOf: fileURL) {
            // we loaded the file into a string!
        }
    }
    
    return ""
}
