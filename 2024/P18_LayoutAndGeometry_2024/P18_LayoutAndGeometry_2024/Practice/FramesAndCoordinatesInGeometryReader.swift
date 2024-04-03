//
//  FramesAndCoordinatesInGeometryReader.swift
//  P18_LayoutAndGeometry_2024
//
//  Created by  Ty Vaughan on 4/3/24.
//

import SwiftUI

struct FramesAndCoordinatesInGeometryReader: View {
    @State private var tabSelection = 3
    
    var body: some View {
        TabView(selection: $tabSelection) {
            
            GeometryReader { proxy in
                Text("Hello world")
                    .frame(width: proxy.size.width * 0.9)
                    .background(.red)
            }
            .tabItem {
                Label("1", systemImage: "1.circle")
            }
            .tag(1)

            /*
             Be default, a GeometryReader will take up all available space. We can see in this example, how the text view is pushed to the bottom.
             */
            VStack {
                GeometryReader { proxy in
                    Text("Hello world")
                        .frame(width: proxy.size.width * 0.9)
                        .background(.red)
                }
                .background(.green)
                Text("More text")
                    .background(.blue)
            }
            .tabItem {
                Label("2", systemImage: "2.circle")
            }
            .tag(2)
            
            /*
             GeometryReader gives a .frame(in:) modifier. This allows us to specify if we want to specify sizing globally based on screen size, or relatively based on the parent view's frame.
             
             These options are called "coordinate spaces". Custom coordinate spaces can be created by attaching the .coordinateSpace() modifier to a view, which allows any of that View's children to read its frame relative to that coordinate space.
             
             Custom coordinate spaces are helpful if we need to base positioning or sizing on Views that are higher up than a view's immediate parent.
             */
            OuterView()
                .background(.red)
                .coordinateSpace(name: "Custom")
                .tabItem {
                    Label("3", systemImage: "3.circle")
                }
                .tag(3)

        }
        
    }
    
    struct OuterView: View {
        var body: some View {
            VStack {
                Text("Top")
                InnerView()
                    .background(.green)
                Text("Bottom")
            }
        }
    }
    
    struct InnerView: View {
        var body: some View {
            HStack {
                Text("Left")
                GeometryReader { proxy in
                    Text("Center")
                        .background(.blue)
                        .onTapGesture {
                            print("Global center: \(proxy.frame(in: .global).midX) x \(proxy.frame(in: .global).midY)")
                            print("Custom center: \(proxy.frame(in: .named("Custom")).midX) x \(proxy.frame(in: .named("Custom")).midY)")
                            print("Local center: \(proxy.frame(in: .local).midX) x \(proxy.frame(in: .local).midY)")
                        }
                }
                .background(.orange)
                Text("Right")
            }
        }
    }
}

#Preview {
    FramesAndCoordinatesInGeometryReader()
}
