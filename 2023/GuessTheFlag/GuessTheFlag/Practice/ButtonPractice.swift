//
//  ButtonPractice.swift
//  GuessTheFlag
//
//  Created by  Ty Vaughan on 5/31/23.
//

import SwiftUI

struct ButtonPractice: View {
    var body: some View {
        VStack(spacing: 20) {
            VStack {
                Button("Delete selection") {
                    print("Now deleting...")
                }
                Button("Delete selection", action: executeDelete)
            }
            VStack {
                // a role can be used to give a system-defined look and feel to the button.
                // Roles also provide extra context for screen readers
                Button("Delete selection", role: .destructive, action: executeDelete)
            }
            VStack {
                // A combination of button style and role can influence the look of the button
                Button("Button 1") {}
                    .buttonStyle(.bordered)
                Button("Button 2", role: .destructive) {}
                    .buttonStyle(.bordered)
                Button("Button 3") {}
                    .buttonStyle(.borderedProminent)
                Button("Button 4", role: .destructive) {}
                    .buttonStyle(.borderedProminent)
                
                // The color of a button can be modified using the .tint modifier
                Button("Button 5") {}
                    .buttonStyle(.borderedProminent)
                    .tint(.mint)
                
                // For a totally custom button, you can pass a label
                Button {
                    print("Button was tapped")
                } label: {
                    Text("Tap me!")
                        .padding()
                        .foregroundColor(.white)
                        .background(.red)
                }
            }
        }
    }
    
    func executeDelete() {
        print("Now deleting...")
    }
}

struct ButtonPractice_Previews: PreviewProvider {
    static var previews: some View {
        ButtonPractice()
    }
}
