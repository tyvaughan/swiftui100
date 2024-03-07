//
//  NavigationDestination.swift
//  P9_Navigation_2024
//
//  Created by  Ty Vaughan on 3/6/24.
//

import SwiftUI

/*
 To avoid the link problem, we need to separate the destination view from the NavigationLink value.
 
 This can be done by providing a value to NavigationLink. This value can be any data type, as long as it conforms to the Hashable protocol.
 Next, we can use the navigationDestination() modifier inside of the NavigationStack to tell it what to do when the NavigationLink with a certain type is triggered.
 For each different type that is handled, we need to add a new navigationDestination() modifier for that type.
 
 When navigationDestination is used to display a new view, that view is only created and always recreated when it is linked to
 */

struct NavigationDestination: View {
    var body: some View {
        NavigationStack {
            NavigationLink("Tap me") {
                Text("Detail view")
            }
        }
        
        NavigationStack {
            List(0..<100) { i in
                NavigationLink("Select \(i)", value: i)
            }
            .navigationDestination(for: Int.self) { selection in
                DetailView(number: selection)
            }
        }
    }
    
    struct DetailView: View {
        var number: Int
        
        var body: some View {
            Text("You selected \(number)")
        }
        
        init(number: Int) {
            self.number = number
            print("Creating detail view \(number)")
        }
    }
}

#Preview {
    NavigationDestination()
}
