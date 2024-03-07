//
//  ProblemWithNavigationLink.swift
//  P9_Navigation_2024
//
//  Created by  Ty Vaughan on 3/6/24.
//

import SwiftUI

/*
 The issue with Navigation link is that as links become visible, SwiftUI creates the view that the link goes to. Some of these views are created more than once. This can hurt performance for large and/or dynamic lists.
 */

struct ProblemWithNavigationLink: View {
    var body: some View {
        NavigationStack {
            List(0..<100) { i in
                NavigationLink("Tap me") {
                    DetailView(number: i)
                }
            }
        }
    }
    
    struct DetailView: View {
        var number: Int
        
        var body: some View {
            Text("Detail view \(number)")
        }
        
        init(number: Int) {
            self.number = number
            print("Creating detail view \(number)")
        }
    }
}

#Preview {
    ProblemWithNavigationLink()
}
