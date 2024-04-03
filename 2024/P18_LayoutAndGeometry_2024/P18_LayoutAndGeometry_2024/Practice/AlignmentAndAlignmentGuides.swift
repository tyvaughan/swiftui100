//
//  AlignmentAndAlignmentGuides.swift
//  P18_LayoutAndGeometry_2024
//
//  Created by  Ty Vaughan on 4/3/24.
//

import SwiftUI

struct AlignmentAndAlignmentGuides: View {
    var body: some View {
        /*
         We can adjust alignment by specifying where the content should be aligned with a specific frame.
         We can additionally provide an offset to further position that content from it's initial position within the frame
         */
        Text("The night is dark and full of terrors.")
            .background(.blue)
            .frame(width: 300, height: 100, alignment: .topLeading)
            .offset(x: 30, y: 20)
            .border(.black)
            .background(.red)
        
        /*
         Alignment can also be specified in stacks.
         
         With text, different characters have a different baseline, which is the line that the character sits on. B/c of this, we should use text baseline alignments.
         */
        HStack(alignment: .lastTextBaseline) {
            Text("Long")
                .font(.caption)
            Text("live")
            Text("the")
                .font(.title)
            Text("King")
                .font(.largeTitle)
        }
        
        /*
         For further control, we can customize alignment for each individual view within a stack. By default, child Views will align based on the alignment setting.
         
         To customize it, we can use the alignmentGuide() modifier. This modifier allows you to change the alignment or provide an offset value
         */
        VStack(alignment: .leading) {
            ForEach(0..<10) { position in
                Text("Number \(position)")
                    .alignmentGuide(.leading) { _ in
                        Double(position) * 10
                    }
            }
        }
        .background(.red)
        .frame(width: 300, height: 300)
        .background(.blue)
        
    }
}

#Preview {
    AlignmentAndAlignmentGuides()
}
