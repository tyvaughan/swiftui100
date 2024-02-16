//
//  StacksPracticeView.swift
//  P2_GuessTheFlag_2024
//
//  Created by  Ty Vaughan on 2/19/24.
//

import SwiftUI

struct StacksPracticeView: View {
    var body: some View {
        VStack(spacing: 10) {
            /*
             VStacks organizes views vertically
             - automatically fits its content
             - default align center
             */
            VStack(alignment: .leading, spacing: 20) {
                Text("Hello, world!")
                Text("This is inside a stack")
            }
            .background(.blue)
            
            /*
             HStack organizes views horizontally
             - automatically fits its content
             - default align center
             */
            HStack(spacing: 20) {
                Text("Hello, world!")
                Text("This is inside a stack")
            }
            .background(.red)
            
            /*
             Spacers can be used to push content
             - if more than one spacer, they will split available space between them
             */
            HStack(spacing: 20) {
                Spacer()
                Text("Hello, world!")
                Text("This is inside a stack")
                Spacer()
            }
            .background(.green)
            
            /*
             ZStack organizes views by depth
             - offers alignment, but not spacing
             */
            ZStack(alignment: .leading) {
                Text("Hellow world!")
                Text("This is inside a stack")
            }
            .background(.purple)
            
            /*
             Grid example
             */
            VStack(spacing: 10) {
                ForEach(0..<3, id: \.self) { _ in
                    HStack(spacing: 10) {
                        ForEach(0..<3, id: \.self) { _ in
                            Rectangle()
                                .frame(width: 10, height: 10)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    StacksPracticeView()
}
