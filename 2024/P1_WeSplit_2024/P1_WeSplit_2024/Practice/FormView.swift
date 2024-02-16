//
//  FormView.swift
//  WeSplit2024
//
//  Created by  Ty Vaughan on 2/13/24.
//

import SwiftUI

struct FormView: View {
    var body: some View {
        Form {
            Section {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
            Section {
                Text("Hello, World!")
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

#Preview {
    FormView()
}
