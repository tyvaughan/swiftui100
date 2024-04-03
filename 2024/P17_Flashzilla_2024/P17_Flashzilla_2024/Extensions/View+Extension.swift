//
//  View+Extension.swift
//  P17_Flashzilla_2024
//
//  Created by  Ty Vaughan on 4/2/24.
//

import Foundation
import SwiftUI

extension View {

    func stacked(at position: Int, in total: Int) -> some View {
        let offset = Double(total - position)
        return self.offset(y: offset * 10)
    }
    
    func cardBackground(at offset: CGSize, _ differentiateWithoutColor: Bool) -> some View {
        let bgColor: Color = differentiateWithoutColor
            ? .white
            : offset.width > 0
                ? .green
                : (offset.width != 0 ? .red : .white)
        return self.background(
            RoundedRectangle(cornerRadius: 25)
                .fill(bgColor)
        )
    }

}
