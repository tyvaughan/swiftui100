//
//  ColorsAndFramesPracticeView.swift
//  P2_GuessTheFlag_2024
//
//  Created by  Ty Vaughan on 2/19/24.
//

import SwiftUI

struct ColorsAndFramesPracticeView: View {
    var body: some View {
        VStack {
            /*
             We can use the background modifier to add color behind a view
             */
            ZStack {
                Text("Your content")
                    .background(.red)
            }
            
            /*
             We can treat color as a View itself
             - by default, takes up all space of parent view
             - can specify width and height
             - can specify min width and height + stretch infinitely
             */
            ZStack {
                Color.purple
                    .frame(minWidth: 200, maxWidth: .infinity, minHeight: 200, maxHeight: .infinity)
                Color.red
                    .frame(width: 200, height: 200)
                Text("Your content")
            }
            
            /*
             We apply colors to materials
             */
            ZStack {
                VStack (spacing: 0) {
                    Color.red
                    Color.blue
                }
                Text("Your content")
                    .foregroundStyle(.secondary)
                    .padding(50)
                    .background(.ultraThinMaterial)
            }
            .ignoresSafeArea()
            
            /*
             We can use custom colors.
             We can use "ignoresSafeArea" to expand into the safe area
             */
            ZStack {
                Color(red: 1, green: 0.8, blue: 0)
                Text("Your content")
            }
            .ignoresSafeArea()
            
        }
    }
}

#Preview {
    ColorsAndFramesPracticeView()
}
