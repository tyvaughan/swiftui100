//
//  ScrollViewEffectsWithGeometryReader.swift
//  P18_LayoutAndGeometry_2024
//
//  Created by  Ty Vaughan on 4/3/24.
//

import SwiftUI

struct ScrollViewEffectsWithGeometryReader: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
    
    var body: some View {
        TabView {
            GeometryReader { fullView in
                ScrollView {
                    ForEach(0..<50) { index in
                        GeometryReader { proxy in
                            Text("Row #\(index)")
                                .font(.title)
                                .frame(maxWidth: .infinity)
                                .background(colors[index % 7])
                                .rotation3DEffect(
                                    .degrees(proxy.frame(in: .global).minY - fullView.size.height / 2) / 5,
                                    axis: (x: 0, y: 1, z: 0)
                                )
                        }
                        .frame(height: 40)
                    }
                }
            }
            .tabItem {
                Label("1", systemImage: "1.circle")
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(1..<20) { num in
                        GeometryReader { proxy in
                            Text("Number \(num)")
                                .font(.largeTitle)
                                .padding()
                                .background(.red)
                                .rotation3DEffect(.degrees(-proxy.frame(in: .global).minX) / 8, axis: (x: 0, y: 1, z: 0))
                                .frame(width: 200, height: 200)
                        }
                        .frame(width: 200, height: 200)
                    }
                }
            }
            .tabItem {
                Label("2", systemImage: "2.circle")
            }
        }
    }
}

#Preview {
    ScrollViewEffectsWithGeometryReader()
}
