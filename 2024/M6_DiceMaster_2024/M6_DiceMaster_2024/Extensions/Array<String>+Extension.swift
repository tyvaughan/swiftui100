//
//  Array<String>+Extension.swift
//  M6_DiceMaster_2024
//
//  Created by  Ty Vaughan on 4/4/24.
//

import Foundation

extension Array<String> {
    
    mutating func resize(to size: Int) {
        let diff = size - count
        guard diff != 0 else { return }
        
        if diff > 0 {
            // Create new array of missing values
            var tmpArr = Array<String>()
            for i in count+1..<size+1 {
                tmpArr.append("\(i)")
            }
            append(contentsOf: tmpArr)
        } else {
            removeLast(diff * -1)
        }
    }
    
}
