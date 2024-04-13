//
//  ScrollPageWrapper.swift
//  M6_DiceMaster_2024
//
//  Created by  Ty Vaughan on 4/5/24.
//

import SwiftUI

struct ScrollPageWrapper<Content: View>: View {
    var content: () -> Content
    
    var body: some View {
        ScrollView {
            HStack {
                content()
            }
        }
        .scrollIndicators(.hidden)
        .frame(maxWidth: .infinity)
        .padding()
    }

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
}

#Preview {
    ScrollPageWrapper{
        Text("Hi")
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
