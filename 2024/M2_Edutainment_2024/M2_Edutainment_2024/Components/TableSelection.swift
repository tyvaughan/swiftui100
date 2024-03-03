//
//  TableSelection.swift
//  M2_Edutainment_2024
//
//  Created by  Ty Vaughan on 3/2/24.
//

import SwiftUI

struct TableSelection: View {
    
    @Binding public var table: Int
    
    @State private var tableOptions = 2...12
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Select the table you want to practice!")
            HStack(spacing: 10) {
                Button {
                    updateTable(-1)
                } label: {
                    Image(systemName: "arrowshape.left.fill")
                        .font(.system(size: 36))
                        .foregroundColor(.white)
                        .frame(width: 50, height: 50)
                        .background(.blue)
                        .cornerRadius(8)
                        .opacity(table == 2 ? 0.5 : 1)
                }
                .disabled(table == 2)
                
                ZStack {
                    Rectangle()
                        .frame(width: 150, height: 200)
                        .foregroundColor(.green)
                        .cornerRadius(16)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.black, lineWidth: 2)
                        )
                        .rotationEffect(Angle(degrees: 3), anchor: .bottomTrailing)
                        .offset(x: 0, y: -4)
                    Rectangle()
                        .frame(width: 150, height: 200)
                        .foregroundColor(.yellow)
                        .cornerRadius(16)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.black, lineWidth: 2)
                        )
                        .rotationEffect(Angle(degrees: -3), anchor: .bottomLeading)
                        .offset(x: 0, y: -1)
                    ZStack {
                        Rectangle()
                            .fill(.red.gradient)
                            .frame(width: 150, height: 200)
                            .cornerRadius(16)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(.black, lineWidth: 2)
                            )
                        HStack(spacing: 0) {
                            Text("\(table)")
                                .font(.system(size: 80))
                            Text("'s")
                                .font(.system(size: 40))
                                .offset(x: 0, y: -10)
                        }
                        .foregroundColor(.white)
                    }
                }
                
                Button {
                    updateTable(1)
                } label: {
                    Image(systemName: "arrowshape.right.fill")
                        .font(.system(size: 36))
                        .foregroundColor(.white)
                        .frame(width: 50, height: 50)
                        .background(.blue)
                        .cornerRadius(8)
                        .opacity(table == 12 ? 0.5 : 1)
                }
                .disabled(table == 12)
            }
        }
    }
    
    func updateTable(_ value: Int) {
        if (value == -1 && table > 2) {
            table -= 1
        } else if (value == 1 && table < 12) {
            table += 1
        }
    }

}

// MARK: - Dynamic Preview

struct TableSelectionPreviewContainer: View {
    @State var tableBindingValue: Int = 5

    var body: some View {
        TableSelection(table: $tableBindingValue)
    }
}

struct TableSelectionPreview: PreviewProvider {
    static var previews: some View {
        TableSelectionPreviewContainer()
    }
}

//#Preview {
//    TableSelection(
//        table: .constant(5)
//    )
//}
