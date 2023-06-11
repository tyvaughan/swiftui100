//
//  AlertPracticeView.swift
//  GuessTheFlag
//
//  Created by  Ty Vaughan on 5/31/23.
//

import SwiftUI

struct AlertPracticeView: View {
    
    // In SwiftUI, we need state to determine if the alert should be showing
    @State private var showingAlert1 = false
    @State private var showingAlert2 = false
    @State private var showingAlert3 = false
    
    /*
     Alerts
     
     It doesn't matter which element the '.alert' modifer is attached to;
     it simply needs to be attached to a View.
     
     Any Button inside of an alert will automatically trigger the alert to close when tapped.
     The Button's closure is for additional logic beyond tapping the button
     */
    
    var body: some View {
        VStack(spacing: 20) {
            Button("Show Alert 1") {
                showingAlert1 = true
            }
            .alert("Important message", isPresented: $showingAlert1) {
                Button("OK") {}
            }
            
            // We can use roles to make alert buttons more meaningful
            Button("Show Alert 2") {
                showingAlert2 = true
            }
            .alert("Important message", isPresented: $showingAlert2) {
                Button("Delete", role: .destructive) {}
                Button("Cancel", role: .cancel) {}
            }
            
            // We can add message text along with the title and buttons
            Button("Show Alert 3") {
                showingAlert3 = true
            }
            .alert("Important message", isPresented: $showingAlert3) {
                Button("OK", role: .cancel) {}
            } message: {
                Text("Please read this.")
            }
        }

    }
}

struct AlertPracticeView_Previews: PreviewProvider {
    static var previews: some View {
        AlertPracticeView()
    }
}
