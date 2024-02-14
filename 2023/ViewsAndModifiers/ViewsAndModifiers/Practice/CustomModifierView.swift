//
//  CustomModifierView.swift
//  ViewsAndModifiers
//
//  Created by  Ty Vaughan on 6/3/23.
//

import SwiftUI

struct CustomModifierView: View {
    var body: some View {
        VStack {
            /*
             To apply a custom modifier, we can use the modifier '.modifier'
             */
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .modifier(Title())
            
            /*
             We can also use the extension notation if we have defined it
             */
            
            Text("Hello, World!")
                .titleStyle()
            
            Color.blue
                .frame(width: 300, height: 300)
                .watermarked(with: "Yo yo yo")
        }
    }
}

struct CustomModifierView_Previews: PreviewProvider {
    static var previews: some View {
        CustomModifierView()
    }
}
