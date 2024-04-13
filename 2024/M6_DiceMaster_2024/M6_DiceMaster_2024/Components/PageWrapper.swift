//
//  PageWrapper.swift
//  M6_DiceMaster_2024
//
//  Created by  Ty Vaughan on 4/4/24.
//

import SwiftUI

struct PageWrapper<Content: View>: View {
    var content: () -> Content
    
    var body: some View {
        VStack {
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
    PageWrapper {
        Text("hi")
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
