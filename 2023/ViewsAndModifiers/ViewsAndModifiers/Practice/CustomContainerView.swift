//
//  CustomContainerView.swift
//  ViewsAndModifiers
//
//  Created by  Ty Vaughan on 6/3/23.
//

import SwiftUI

struct CustomContainerView: View {
    var body: some View {
        GridStack(rows: 4, columns: 4) { row, col in
            HStack {
                Image(systemName: "\(row * 4 + col).circle")
                Text("R\(row) C\(col)")
            }
        }
    }
}

struct CustomContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomContainerView()
    }
}
