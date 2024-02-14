//
//  View+Extensions.swift
//  WeSplit
//
//  Created by  Ty Vaughan on 5/30/23.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
