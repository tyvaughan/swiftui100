//
//  ImageCredit.swift
//  P19_SnowSeeker_2024
//
//  Created by  Ty Vaughan on 4/20/24.
//

import Foundation
import SwiftUI

struct ImageCredit: ViewModifier {
    var credit: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(credit)
                .font(.caption)
                .foregroundStyle(.white)
                .padding(5)
                .background(.black.opacity(0.5))
        }
    }
}

extension View {
    func imageCredit(for credit: String) -> some View {
        modifier(ImageCredit(credit: credit))
    }
}
