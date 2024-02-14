//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by  Ty Vaughan on 6/2/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            /*
             Every modifier applied returns a new View with that change applied
             */
            
            Text("Hello, world!")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.red)
            
            /*
             SwiftUI has a 10 child view limit b/c views that contain multiple children
             are converted to a TupleView, which only allows up to 10 children Views
             */

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
