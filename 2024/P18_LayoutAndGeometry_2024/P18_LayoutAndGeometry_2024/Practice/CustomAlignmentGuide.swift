//
//  CustomAlignmentGuide.swift
//  P18_LayoutAndGeometry_2024
//
//  Created by  Ty Vaughan on 4/3/24.
//

import SwiftUI

/*
 To create a custom alignment, we must extend either VerticalAlignment or HorizontalAlignment, and conform to the AlignmentID protocol
 */

struct CustomAlignmentGuide: View {
    var body: some View {
        HStack(alignment: .midAccountAndName) {
            Text("Hi")
                .background(.blue)

            VStack {
                Text("@SpaceBoy")
                    .alignmentGuide(.midAccountAndName) { d in
                        // This says where the View should be aligned relative to the alignment guide
                        d[VerticalAlignment.center]
                    }
                Image(.armstrong)
                    .resizable()
                    .frame(width: 64, height: 64)
            }
            .background(.red)

            VStack {
                Text("Full name:")
                Text("ARMSTRONG")
//                    .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }
                    .font(.largeTitle)
            }
            .background(.purple)
            
            Text("Hi")
                .background(.blue)
        }
        .background(.yellow)
    }
}

extension VerticalAlignment {
    /*
     If we make this a struct, it is possible to create an instance of the struct, which doesn't make sense because it doesn't contain any functionality; it's only used for layout guides.
     
     Because of this, we'll declare it as an enum.
     */
    enum MidAccountAndName: AlignmentID {
        /*
         This method is required to conform with AlignmentID, and is used in cases where a View does not have an .alignmentGuide() modifier.
         
         This default method determines how the view will align relative to the alignment guide itself.
         */
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.bottom]
        }
    }
    
    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}

#Preview {
    CustomAlignmentGuide()
}
