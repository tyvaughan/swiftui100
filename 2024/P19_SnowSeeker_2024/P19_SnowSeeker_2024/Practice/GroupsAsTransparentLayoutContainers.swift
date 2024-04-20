//
//  GroupsAsTransparentLayoutContainers.swift
//  P19_SnowSeeker_2024
//
//  Created by  Ty Vaughan on 4/18/24.
//

import SwiftUI

struct UserView: View {
    /*
     By using "Group" instead of a Stack, we allow the enclosing View to determine the layout of the contents of the "UserView" View. This allows us to have our components better fit a larger variety of spaces.
     */
    var body: some View {
        Group {
            Text("Name: Paul")
            Text("Country: England")
            Text("Pets: Luna and Arya")
        }
        .font(.title)
    }
}

struct GroupsAsTransparentLayoutContainers: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    @State private var layoutVertically = false
    
    var body: some View {
        /*
         We can dynamically fit the screen or layout needs using state.
         */
        Button {
            layoutVertically.toggle()
        } label: {
            if layoutVertically {
                VStack {
                    UserView()
                }
            } else {
                HStack {
                    UserView()
                }
            }
        }
        
        /*
         We can also use size classes provided by swift. We have horizontal and vertical orientations, each of which has two size classes: .compact and .regular.
         
         All of Apple's screen sizes and orientations are accounted for by the four combinations of size class values.
         */
        if horizontalSizeClass == .compact {
            VStack {
                UserView()
            }
        } else {
            HStack {
                UserView()
            }
        }
        
        /*
         If we aren't passing any parameters to the rendered view, we can just pass the initializer since it matches the param signature of () -> Content
         */
        if horizontalSizeClass == .compact {
            VStack(content: UserView.init)
        } else {
            HStack(content: UserView.init)
        }
        
        /*
         We can use the "ViewThatFits" View to provide multiple options and preserve the state of each. The option that shows is the one that Swift determines can fit the available space.
         
         We give up fine grained control for some automation, while also gaining another technique to accomodate the space we have.
         */
        ViewThatFits {
            Rectangle()
                .frame(width: 500, height: 200)
            Circle()
                .frame(width: 200, height: 200)
        }
    }
}

#Preview {
    GroupsAsTransparentLayoutContainers()
}
