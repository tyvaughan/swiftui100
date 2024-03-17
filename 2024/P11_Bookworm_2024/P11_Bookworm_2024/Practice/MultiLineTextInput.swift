//
//  MultiLineTextInput.swift
//  P11_Bookworm_2024
//
//  Created by  Ty Vaughan on 3/13/24.
//

import SwiftUI

struct MultiLineTextInput: View {
    @AppStorage("notes") private var notes = ""

    var body: some View {
        NavigationStack {
            Form {
                /*
                 For a multiline input, we can use TextEditor for a text-area.
                 */
                TextEditor(text: $notes)
                    .navigationTitle("Notes")
                    .padding()
                
                /*
                 We can also allow a text field to grow. However, it doesn't support newline characters.
                 */
                TextField("Enter your text", text: $notes, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .navigationTitle("Notes")
                    .padding()
            }
        }
    }
}

#Preview {
    MultiLineTextInput()
}
