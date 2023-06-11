//
//  ProminentTitleModifier.swift
//  P2_GuessTheFlag
//
//  Created by  Ty Vaughan on 6/7/23.
//

import Foundation
import SwiftUI

struct ProminentTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

extension View {
    func prominentTitle() -> some View {
        modifier(ProminentTitleModifier())
    }
}
