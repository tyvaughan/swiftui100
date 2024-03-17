//
//  CustomComponentWithBinding.swift
//  P11_Bookworm_2024
//
//  Created by  Ty Vaughan on 3/13/24.
//

import SwiftUI

struct PushButton: View {
    let title: String
    @Binding var isOn: Bool
    
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(LinearGradient(colors: isOn ? onColors : offColors, startPoint: .top, endPoint: .bottom))
        .foregroundStyle(.white)
        .clipShape(.capsule)
        .shadow(radius: isOn ? 0 : 5)
    }
}

struct CustomComponentWithBinding: View {
    @State private var rememberMe = false

    var body: some View {
        VStack {
            PushButton(title: "Hi", isOn: $rememberMe)
            Text(rememberMe ? "On" : "Off")
        }
    }
}

#Preview {
    CustomComponentWithBinding()
}
