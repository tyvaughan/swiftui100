//
//  AskForAppStoreReview.swift
//  P13_Instafilter_2024
//
//  Created by  Ty Vaughan on 3/19/24.
//

import StoreKit
import SwiftUI

struct AskForAppStoreReview: View {
    @Environment(\.requestReview) var requestReview
    
    var body: some View {
        Button("Leave a review") {
            requestReview()
        }
    }

}

#Preview {
    AskForAppStoreReview()
}
