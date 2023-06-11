//
//  Day20.swift
//  GuessTheFlag
//
//  Created by  Ty Vaughan on 5/31/23.
//

import SwiftUI

struct StackPractice: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Group {
                ZStack {
                    Color.red
                        .frame(minWidth:50, maxWidth: .infinity, maxHeight: 50)
                    Text("Your content")
                }
                ZStack {
                    Color(red: 1, green: 0.8, blue: 0)
                        .frame(minWidth:50, maxWidth: .infinity, maxHeight: 50)
                    Text("Your content")
                }
                ZStack {
                    VStack(spacing: 0) {
                        Color.red
                        Color.blue
                    }
                    Text("Your content")
                        .foregroundColor(.secondary)
                        .padding(50)
                        .background(.ultraThinMaterial)
                }
            }
            Group {
                HStack(alignment: .top, spacing: 20) {
                    Text("⬛️")
                    Text("⬜️")
                    Text("⬛️")
                }
                HStack(alignment: .top, spacing: 20) {
                    Text("⬜️")
                    Text("⬛️")
                    Text("⬜️")
                }
                HStack(alignment: .top, spacing: 20) {
                    Text("⬛️")
                    Text("⬜️")
                    Text("⬛️")
                }
            }

            Spacer()
        }
    }
}

struct StackPractice_Previews: PreviewProvider {
    static var previews: some View {
        StackPractice()
    }
}
