//
//  OrderingView.swift
//  P10_CupcakeCorner_2024
//
//  Created by  Ty Vaughan on 3/11/24.
//

import SwiftUI

struct OrderingView: View {
    @State private var order = Order()
    
    var body: some View {
        Form {
            Section {
                Picker("Select your cake type", selection: $order.type) {
                    ForEach(Order.types.indices, id: \.self) {
                        Text(Order.types[$0])
                    }
                }
                
                Stepper("Number of cakes: \(order.quantity)", value: $order.quantity, in: 3...20)
            }
            
            Section {
                Toggle("Any special requests?", isOn: $order.specialRequestEnabled)
                if order.specialRequestEnabled {
                    Toggle("Add extra frosting", isOn: $order.extraFrosting)
                    Toggle("Add extra sprinkles", isOn: $order.addSprinkles)
                }
            }
            
            Section {
                NavigationLink("Delivery details") {
                    AddressView(order: order)
                }
            }
        }
        .navigationTitle("Cupcake Corner")
    }
}

#Preview {
    NavigationStack {
        OrderingView()
    }
}
