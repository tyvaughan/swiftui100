//
//  ScrollViewEffectsWithOtherTools.swift
//  P18_LayoutAndGeometry_2024
//
//  Created by  Ty Vaughan on 4/3/24.
//

import SwiftUI

struct ScrollViewEffectsWithOtherTools: View {
    @State private var tabSelection = 2
    
    var body: some View {
        TabView(selection: $tabSelection) {
            
            /*
             In this example, we use a GeometryReader.
             
             We must specify a frame to keep the GeometryReader from expanding to the screen edges, which we don't want to do.
             */
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(1..<20) { num in
                        GeometryReader { proxy in
                            Text("Number \(num)")
                                .font(.largeTitle)
                                .padding()
                                .background(.red)
                                .rotation3DEffect(
                                    .degrees(-proxy.frame(in: .global).minX) / 8,
                                    axis: (x: 0, y: 1, z: 0)
                                )
                                .frame(width: 200, height: 200)
                        }
                        .frame(width: 200, height: 200)
                    }
                }
            }
            .tabItem {
                Label("1", systemImage: "1.circle")
            }
            
            /*
             Instead, we can use .visualEffect() modifier, which allows us to alter how something looks but not its layout or position.
             */
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(1..<20) { num in
                        Text("Number \(num)")
                            .font(.largeTitle)
                            .padding()
                            .background(.red)
                            .frame(width: 200, height: 200)
                            .visualEffect { content, proxy in
                                content
                                    .rotation3DEffect(
                                        .degrees(-proxy.frame(in: .global).minX) / 8,
                                        axis: (x: 0, y: 1, z: 0)
                                    )
                            }
                    }
                }
                .scrollTargetLayout() // Here we define each View in the HStack as being a scroll target
            }
            .scrollTargetBehavior(.viewAligned) // Here we make sure the scroll view is always aligned to show a scroll target
            .tabItem {
                Label("2", systemImage: "2.circle")
            }
        }
    }
}

#Preview {
    ScrollViewEffectsWithOtherTools()
}
