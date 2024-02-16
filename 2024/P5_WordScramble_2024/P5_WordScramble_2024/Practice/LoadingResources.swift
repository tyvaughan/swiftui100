//
//  LoadingResources.swift
//  P5_WordScramble_2024
//
//  Created by  Ty Vaughan on 2/25/24.
//

import Foundation

func loadFile(named file: String, withExtension ext: String?) {
    if let fileUrl = Bundle.main.url(forResource: file, withExtension: ext) {
        // we found the file in our bundle!
        // Now we can load the file
        if let fileContents = try? String(contentsOf: fileUrl) {
            // we loaded the file into a string!
        }
    }
}
