//
//  Challenge.swift
//  P18_LayoutAndGeometry_2024
//
//  Created by  Ty Vaughan on 4/3/24.
//

import SwiftUI

struct Challenge: View {
    @State private var selectedTab = 3
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
    
    var body: some View {
        TabView(selection: $selectedTab) {
            
            /*
             Challenge #1
             */
            GeometryReader { fullView in
                ZStack(alignment: .top) {
                    // This line shows the top of the frame
                    Rectangle()
                        .frame(width: fullView.frame(in: .global).width, height: 1)
                        .offset(y: 0)
                    // This line shows 200 from the top of the frame
                    Rectangle()
                        .frame(width: fullView.frame(in: .global).width, height: 1)
                        .offset(y: 200)
                    ScrollView(.vertical) {
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
                                    .opacity(getOpacity(proxy, fullView))
                            }
                            .frame(height: 40)
                        }
                    }
                }
            }
            .tabItem {
                Label("1", systemImage: "1.circle")
            }
            .tag(1)
            
            /*
             Challenge #2
             */
            GeometryReader { fullView in
                ScrollView(.vertical) {
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
                                .scaleEffect(getScale(proxy, fullView))
                        }
                        .frame(height: 40)
                    }
                }
            }
            .tabItem {
                Label("2", systemImage: "2.circle")
            }
            .tag(2)
            
            /*
             Challenge #3
             */
            GeometryReader { fullView in
                ScrollView(.vertical) {
                    ForEach(0..<50) { index in
                        GeometryReader { proxy in
                            Text("Row #\(index)")
                                .font(.title)
                                .frame(maxWidth: .infinity)
                                .background(getColor(proxy, fullView, index % 2 == 0))
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
                Label("3", systemImage: "3.circle")
            }
            .tag(3)
            
        }
    }
    
    func getOpacity(_ proxy: GeometryProxy, _ fullView: GeometryProxy) -> Double {
        let diff = proxy.frame(in: .global).minY - fullView.frame(in: .global).minY
        return max(Double(diff) / 200, 0)
    }
    
    func getScale(_ proxy: GeometryProxy, _ fullView: GeometryProxy) -> CGFloat {
        let mid = fullView.frame(in: .global).midY
        let scaleRaw = proxy.frame(in: .global).minY / mid
        return max(min(1.5, scaleRaw), 0.5)
    }
    
    func getColor(_ proxy: GeometryProxy, _ fullView: GeometryProxy, _ invert: Bool) -> Color {
        let hue = (proxy.frame(in: .global).minY - fullView.frame(in: .global).minY) / fullView.frame(in: .global).maxY
        return Color(
            hue: hue, //invert ? 1 - hue : hue,
            saturation: 1,
            brightness: 1
        )
    }
    
}

#Preview {
    Challenge()
}
