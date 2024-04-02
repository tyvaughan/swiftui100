//
//  AddingSwiftPackageDependencies.swift
//  P16_HotProspects_2024
//
//  Created by  Ty Vaughan on 4/1/24.
//

import SamplePackage
import SwiftUI

struct AddingSwiftPackageDependencies: View {
    let possibleNumbers = 1...60
    var results: String {
        let selected = possibleNumbers.random(7).sorted()
        let strings = selected.map(String.init)
        return strings.formatted()
    }
    
    var body: some View {
        Text(results)
    }
}

#Preview {
    AddingSwiftPackageDependencies()
}
