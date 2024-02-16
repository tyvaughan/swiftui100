//
//  View+Extensions.swift
//  P1_WeSplit_2024
//
//  Created by  Ty Vaughan on 2/15/24.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
