//
//  ContentView.swift
//  P3_ViewsAndModifiers_2024
//
//  Created by  Ty Vaughan on 2/21/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.red)
        VStack {
            Text("Customer modifier")
                .modifier(ProminentTitle())
            Text("Customer modifier")
                .isProminent()
        }
    }
}

// MARK: - Modifiers

struct ProminentTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

// MARK: - Extensions

extension View {
    func isProminent() -> some View {
        modifier(ProminentTitle())
    }
}

// MARK: - Preview

#Preview {
    ContentView()
}
