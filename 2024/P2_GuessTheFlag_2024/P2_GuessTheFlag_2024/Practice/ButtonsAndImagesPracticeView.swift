//
//  ButtonsAndImagesPracticeView.swift
//  P2_GuessTheFlag_2024
//
//  Created by  Ty Vaughan on 2/19/24.
//

import SwiftUI

struct ButtonsAndImagesPracticeView: View {
    var body: some View {
        VStack {
            
            // MARK: Buttons
            
            /*
             Buttons will run a method when pressed
             */
            Button("Delete selection", action: executeDelete)
            
            /*
             We can use built-in roles to style buttons
             */
            Button("Delete selection", role: .destructive, action: executeDelete)
            
            /*
             We can use built-in style modifiers.
             By default, they use the "borderless" style
             */
            HStack {
                Button("Button 1", action: executeDelete)
                    .buttonStyle(.bordered)
                Button("Button 2", role: .destructive, action: executeDelete)
                    .buttonStyle(.bordered)
                Button("Button 3", action: executeDelete)
                    .buttonStyle(.borderedProminent)
                    .tint(.mint) // customize bordered button colors with ".tint"
                Button("Button 4", role: .destructive, action: executeDelete)
                    .buttonStyle(.borderedProminent)
            }
            
            /*
             For completely custom looks, we can pass a custom label
             */
            Button {
                print("Button was tapped")
            } label: {
                Text("Tap me!")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.red)
                    .cornerRadius(16)
            }
            
            // MARK: Images
            
            /*
             There are three main ways to specify images
             - images with a screen reader prompt
             - images w/o a screen reader prompt (purely decorative)
             - Apple system images using SF Symbols
             */
            VStack {
                // Create image and enable screen reader with prompt
                Image("pencil")
                // Create image and disabe screen reader
                Image(decorative: "pencil")
                // Use Apple system icon
                Image(systemName: "pencil")
            }
            
            /*
             We create create an Image Button using the label argument
             */
            Button {
                print("Edit button was tapped")
            } label: {
                Image(systemName: "pencil")
            }
            
            /*
             We can include text and an image in a button
             */
            Button("Edit", systemImage: "pencil") {
                print("Edit button was tapped")
            }
            
            /*
             If we want text and an image with a more custom look, we can use the Label struct
             
             By using a label, Swift will automatically determine whether to show the text, image, or both depending on the layout
             */
            Button {
                print("Edit button was tapped")
            } label: {
                Label("Edit", systemImage: "pencil")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.red)
                    .cornerRadius(8)
            }
        }
    }
    
    func executeDelete() {
        print("Now deleting...")
    }
}

#Preview {
    ButtonsAndImagesPracticeView()
}
