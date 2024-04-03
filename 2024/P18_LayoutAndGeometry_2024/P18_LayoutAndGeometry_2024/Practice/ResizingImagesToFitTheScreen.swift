//
//  ResizingImagesToFitTheScreen.swift
//  P18_LayoutAndGeometry_2024
//
//  Created by  Ty Vaughan on 4/3/24.
//

import SwiftUI

/*
 We can use the frame modifier to specify constant sizing for a View, but if we want dynamically sized content, we can use GeometryReader.
 
 The GeometryReader View allows us to dynamically size content based on the screen.
 */

struct ResizingImagesToFitTheScreen: View {
    var body: some View {
        TabView {
            
            /*
             Here we have an example where we create an image with a constant size.
             */
            Image(.armstrong)
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .tabItem {
                    Label("1", systemImage: "1.circle")
                }
            
            /*
             GeometryReader exposes a GeometryProxy instance, which contains information about sizing and positioning.
             
             By default, the GeometryReader will size our content, then place it in the top left of the View.
             */
            GeometryReader { proxy in
                Image(.armstrong)
                    .resizable()
                    .scaledToFit()
                    .frame(width: proxy.size.width * 0.8)
            }
            .tabItem {
                Label("2", systemImage: "2.circle")
            }
            
            /*
             The .containerRelativeFrame() modifier only considers certain views as containers. For example, it excludes HStack and VStack, which makes it difficult to subdivide stacks.
             
             In this example, .containerRelativeFrame() won't consider the HStack, so instead considers just the size of the screen instead of the size of the remaining size within the HStack.
             */
            HStack {
                Text("IMPORTANT")
                    .frame(width: 200)
                    .background(.blue)
                Image(.armstrong)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { size, axis in
                        size * 0.8
                    }
            }
            .tabItem {
                Label("3", systemImage: "3.circle")
            }
            
            /*
             If we try the previous example with GeometryReader, it will correctly recognize the remaining size within the HStack.
             */
            HStack {
                Text("IMPORTANT")
                    .frame(width: 200)
                    .background(.blue)
                GeometryReader { proxy in
                    Image(.armstrong)
                        .resizable()
                        .scaledToFit()
                        .frame(width: proxy.size.width * 0.8)
                }
            }
            .frame(height: 200)
            .background(.yellow)
            .tabItem {
                Label("4", systemImage: "4.circle")
            }
            
            /*
             If we want to vertically center the content of a GeometryReader, we can use a second .frame() modifier to create a View that fills the entire available space and centers the content.
             */
            HStack {
                Text("IMPORTANT")
                    .frame(width: 200)
                    .background(.blue)
                GeometryReader { proxy in
                    Image(.armstrong)
                        .resizable()
                        .scaledToFit()
                        .frame(width: proxy.size.width * 0.8)
                        .frame(width: proxy.size.width, height: proxy.size.height)
                }
            }
            .frame(height: 200)
            .background(.yellow)
            .tabItem {
                Label("5", systemImage: "5.circle")
            }

            

        }
    }
}

#Preview {
    ResizingImagesToFitTheScreen()
}
