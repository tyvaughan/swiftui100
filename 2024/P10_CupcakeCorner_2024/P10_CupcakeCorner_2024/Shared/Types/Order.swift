//
//  Order.swift
//  P10_CupcakeCorner_2024
//
//  Created by  Ty Vaughan on 3/11/24.
//

import Foundation

@Observable
class Order: Codable {

    struct Address: Codable {
        var name: String = ""
        var streetAddress: String = ""
        var city: String = ""
        var zip: String = ""
    }
    
    enum CodingKeys: String, CodingKey {
        case _type = "type"
        case _quantity = "quantity"
        case _specialRequestEnabled = "specialRequestEnabled"
        case _extraFrosting = "extraFrosting"
        case _addSprinkles = "addSprinkles"
        case _address = "address"
    }

    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = 0
    var quantity = 3
    
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
    
    // Address properties
    var address = Address() {
        didSet {
            if let encoded = try? JSONEncoder().encode(address) {
                UserDefaults.standard.set(encoded, forKey: "OrderAddress")
            }
            print("updated address", address)
        }
    }
    var hasValidAddress: Bool {
        if address.name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
            address.streetAddress.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
            address.city.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
            address.zip.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return false
        }
        return true
    }
    
    // Checkout properties
    var cost: Double {
        // $2 per cake
        var cost = Double(quantity) * 2
        
        // complicated cakes cost more
        cost += (Double(type) / 2)
        
        // $1/cake for extra frosting
        if extraFrosting {
            cost += Double(quantity)
        }
        
        // $0.50/cake for sprinkles
        if addSprinkles {
            cost += Double(quantity) / 2
        }
        
        return cost
    }
    
    init() {
        if let savedAddress = UserDefaults.standard.data(forKey: "OrderAddress") {
            if let decodedAddress = try? JSONDecoder().decode(Address.self, from: savedAddress) {
                print("decoded address", decodedAddress)
                address = decodedAddress
                return
            }
        }
        address = Address()
    }
}
