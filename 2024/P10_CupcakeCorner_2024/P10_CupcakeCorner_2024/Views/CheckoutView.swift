//
//  CheckoutView.swift
//  P10_CupcakeCorner_2024
//
//  Created by  Ty Vaughan on 3/12/24.
//

import SwiftUI

struct CheckoutView: View {
    var order: Order
    
    @State private var checkoutSuccessful = false
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false

    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
                
                Text("Your total is \(order.cost, format: .currency(code: "USD"))")
                    .font(.title)
                
                Button("Place order") {
                    Task {
                        await placeOrder()
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .alert(checkoutSuccessful ? "Thank you!" : "Uh oh!", isPresented: $showingConfirmation) {
            Button("OK") {
                
            }
        } message: {
            Text(confirmationMessage)
        }
    }
    
    func placeOrder() async {
        // Convert the order to JSON
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }
        
        // Send the request to place the order
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            
            // Decode the response
            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            print(decodedOrder)
            checkoutSuccessful = true
            confirmationMessage = "Your order for \(decodedOrder.quantity)x \(Order.types[decodedOrder.type].lowercased()) cupcakes is on its way!"
            showingConfirmation = true
        } catch {
            checkoutSuccessful = false
            confirmationMessage = "Something went wrong while submitting your order. Please try again."
            showingConfirmation = true
            print("Checkout failed: \(error.localizedDescription)")
        }
    }
}

#Preview {
    NavigationStack {
        CheckoutView(order: Order())
    }
}
