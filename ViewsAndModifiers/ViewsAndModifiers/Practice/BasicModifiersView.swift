//
//  BasicModifiersView.swift
//  ViewsAndModifiers
//
//  Created by  Ty Vaughan on 6/3/23.
//

import SwiftUI

struct BasicModifiersView: View {
    var body: some View {
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

struct BasicModifiersView_Previews: PreviewProvider {
    static var previews: some View {
        BasicModifiersView()
    }
}
