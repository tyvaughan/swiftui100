//
//  ShareContentWithShareLink.swift
//  P13_Instafilter_2024
//
//  Created by  Ty Vaughan on 3/19/24.
//

import SwiftUI

struct ShareContentWithShareLink: View {
    
    let exampleImg = Image(.apollo1)

    var body: some View {
        VStack {
            /*
             We can share content with a ShareLink. Clicking it will bring up a share sheet.
             */
            ShareLink(item: URL(string: "https://www.hackingwithswift.com")!)
            
            /*
             We can customize the shared contents with a custom title and message. Different apps will use that information to display links.
             */
            ShareLink(
                item: URL(string: "https://www.hackingwithswift.com")!,
                subject: Text("Learn Swift here"),
                message: Text("Check out the 100 Days of SwiftUI!")
            )
            
            /*
             We can customize the shared contents with a preview as well.
             */
            ShareLink(
                item: URL(string: "https://www.hackingwithswift.com")!,
                subject: Text("Learn Swift here"),
                message: Text("Check out the 100 Days of SwiftUI!"),
                preview: SharePreview("Apollo 1", image: exampleImg)
            )
        }
    }
}

#Preview {
    ShareContentWithShareLink()
}
