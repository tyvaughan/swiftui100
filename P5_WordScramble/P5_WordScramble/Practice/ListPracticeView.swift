//
//  ListPracticeView.swift
//  P5_WordScramble
//
//  Created by  Ty Vaughan on 6/9/23.
//

import SwiftUI

struct ListPracticeView: View {
    var body: some View {
        VStack(spacing: 0) {
            // A list can contain hardcoded views, dynamic views, or both
            List {
                Section {
                    Text("Hello, World!")
                    Text("Hello, World!")
                } header: {
                    Text("Section 1")
                }
                
                Section("Section 2") {
                    ForEach(0..<2) {
                        Text("Dynamic view \($0)")
                    }
                }
                
                Section("Section 3") {
                    Text("Hello, World!")
                    Text("Hello, World!")
                }
            }
            .listStyle(.insetGrouped)
            
            // Unlike a Form, a List be made entirely of dynamic rows
            List(0..<5, id: \.self) {
                Text("Dynamic row \($0)")
            }
        }
    }
}

struct ListPracticeView_Previews: PreviewProvider {
    static var previews: some View {
        ListPracticeView()
    }
}
