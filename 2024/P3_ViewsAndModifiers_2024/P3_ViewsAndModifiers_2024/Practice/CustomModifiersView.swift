//
//  CustomModifiersView.swift
//  P3_ViewsAndModifiers_2024
//
//  Created by  Ty Vaughan on 2/21/24.
//

import SwiftUI

/*
 Remember:
 - Custom modifiers can have their own stored properties.
 - View extensions cannot -> they can only have computed properties.
 */

struct CustomModifiersView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .modifier(Title())
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .titleStyle()
        Color.blue
            .frame(width: 300, height: 300)
            .waterMarked(with: "Hacking with Swift")
    }
}

// MARK: - View Modifier

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.blue)
            .clipShape(.rect(cornerRadius: 10))
    }
}

struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundStyle(.white)
                .padding(5)
                .background(.black)
        }
    }
}

// MARK: - Extension for View Modifier

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
    
    func waterMarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

// MARK: - Preview
#Preview {
    CustomModifiersView()
}
