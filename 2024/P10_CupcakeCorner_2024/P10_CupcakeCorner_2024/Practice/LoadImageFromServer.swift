//
//  LoadImageFromServer.swift
//  P10_CupcakeCorner_2024
//
//  Created by  Ty Vaughan on 3/11/24.
//

import SwiftUI

/*
 If we want to load an image from a server, we need to use AsyncImage instead of Image
 */

struct LoadImageFromServer: View {
    var body: some View {
        
        /*
         AsyncImage's cannot be resized because Swift does not know the size information of the image until the resource is loaded.
         
         We need to instead provide how to size the image after it is retrieved, and also provide a placeholder while we are waiting for the image to be retrieved.
         */
        
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"), scale: 3) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            ZStack {
                Color.red
                ProgressView()
            }
        }
            .frame(width: 200, height: 200)
        
        /*
         We can also show separate content while the image is loaded, when the image is loaded, and if the image fetch errored out.
         */
        
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                Text("There was an error loading the image.")
            } else {
                ProgressView()
            }
        }
        .frame(width: 200, height: 200)
    }
}

#Preview {
    LoadImageFromServer()
}
