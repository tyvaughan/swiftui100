//
//  UserDefaults.swift
//  P7_iExpense_2024
//
//  Created by  Ty Vaughan on 3/3/24.
//

import SwiftUI

struct UserDefaultsPractice: View {
    /*
     We can load a variable from UserDefaults. This will return the value if stored, or the default value for the data type
     */
    // @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    
    /*
     Instead of accessing UserDefaults directly, we can use the @AppStorage property wrapper
     
     We provide the string name that UserDefaults will use as the storage key.
     
     This allows us to provide our own default value.
     */
    @AppStorage("tapCount") private var tapCount = 0

    var body: some View {
        Button("Tap count: \(tapCount)") {
            tapCount += 1
            UserDefaults.standard.set(tapCount, forKey: "Tap")
        }
        Text("hi")
    }
}

#Preview {
    UserDefaultsPractice()
}
