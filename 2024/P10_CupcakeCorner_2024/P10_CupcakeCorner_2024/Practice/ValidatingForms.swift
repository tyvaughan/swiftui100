//
//  ValidatingForms.swift
//  P10_CupcakeCorner_2024
//
//  Created by  Ty Vaughan on 3/11/24.
//

import SwiftUI

struct ValidatingForms: View {
    @State private var username = ""
    @State private var email = ""
    
    var disableForm: Bool {
        username.isEmpty || email.isEmpty
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            Section {
                Button("Create account") {
                    print("Creating account...")
                }
            }
            .disabled(disableForm)
        }
    }
}

#Preview {
    ValidatingForms()
}
