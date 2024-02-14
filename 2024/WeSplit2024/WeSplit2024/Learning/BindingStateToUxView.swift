//
//  BindingStateToUxView.swift
//  WeSplit2024
//
//  Created by  Ty Vaughan on 2/13/24.
//

import SwiftUI

struct BindingStateToUxView: View {
    @State private var name = ""

    var body: some View {
        Form {
            TextField("Enter your name", text: $name)
            Text("Hello, \(name)!")
        }
    }
}

#Preview {
    BindingStateToUxView()
}
