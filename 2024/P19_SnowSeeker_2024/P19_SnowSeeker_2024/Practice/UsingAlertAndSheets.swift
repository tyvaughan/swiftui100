//
//  UsingAlertAndSheets.swift
//  P19_SnowSeeker_2024
//
//  Created by  Ty Vaughan on 4/18/24.
//

import SwiftUI

struct UsingAlertAndSheets: View {
    
    struct User: Identifiable {
        var id = "Taylor Swift"
    }

    @State private var selectedUser: User? = nil
    @State private var isShowingUser = false
    
    var body: some View {
        
        /*
         When this selectedUser optional variable is no longer nil, the sheet will pop up.
         When the sheet view is dismissed, the variable will be set back to nil.
         */
//        Button("Tap Me 1") {
//            selectedUser = User()
//        }
//        .sheet(item: $selectedUser) { user in
//            Text(user.id)
//        }
        
        /*
         When this selectedUser optional variable is no longer nil, the alert will pop up.
         When the alert view is dismissed, the variable will be set back to nil.
         */
//        Button("Tap Me 2") {
//            isShowingUser = true
//        }
//        .alert("Welcome", isPresented: $isShowingUser, presenting: selectedUser) { user in
//            Button(user.id) { }
//        }
        
        /*
         When showing sheets, we can use presentationDetents to provide a specific set of heights at which the sheet can be pulled to accomodate the user and need for data display.
         */
        
        Button("Tap Me 3") {
            selectedUser = User()
        }
        .sheet(item: $selectedUser) { user in
            Text(user.id)
                .presentationDetents([.height(100), .medium, .large])
        }

    }
}

#Preview {
    UsingAlertAndSheets()
}
