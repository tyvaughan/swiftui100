//
//  LoopsView.swift
//  WeSplit2024
//
//  Created by  Ty Vaughan on 2/13/24.
//

import SwiftUI

struct LoopsView: View {
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        NavigationStack {
            Form {
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
            }
        }
    }
}

#Preview {
    LoopsView()
}
