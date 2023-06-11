//
//  ImagePractice.swift
//  GuessTheFlag
//
//  Created by  Ty Vaughan on 5/31/23.
//

import SwiftUI

struct ImagePractice: View {
    var body: some View {
        VStack(spacing: 20) {
            VStack {
                // There are three types of images in SwiftUI
                
                // 1. you can load an image added to the project and give the screen reader access
                //   NOTE: the screen reader will read the image name, so make it meaningful!
                Image("pencil")
                
                // 2. you can load an image added to the project, but not give the screen reader access
                Image(decorative: "pencil")
                
                // 3. you can load one of Apple's built in SF symbols
                Image(systemName: "pencil")
            }
            VStack {
                // We can now use images in buttons!
                Button {
                    print("Edit button was tapped")
                } label: {
                    Image(systemName: "pencil")
                }
                
                // SwiftUI has a Label view that supports text with an image
                Button {
                    print("Edit button was tapped")
                } label: {
                    Label("Edit", systemImage: "pencil")
                }
            }
        }
    }
}

struct ImagePractice_Previews: PreviewProvider {
    static var previews: some View {
        ImagePractice()
    }
}
