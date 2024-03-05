//
//  HeirarchicalCodableData.swift
//  P8_Moonshot_2024
//
//  Created by  Ty Vaughan on 3/4/24.
//

import SwiftUI

/*
 As long as each type extends the Codable protocol, complex JSON structures can be decoded and encoded.
 */

struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}

struct HeirarchicalCodableData: View {
    var body: some View {
        Button("Decode JSON") {
            let input = """
            {
                "name": "Taylor Swift",
                "address": {
                    "street": "555, Taylor Swift Avenue",
                    "city": "Nashville"
                }
            }
            """
            
            let data = Data(input.utf8)
            let decoder = JSONDecoder()
            if let user = try? decoder.decode(User.self, from: data) {
                print(user.address.street)
            }
        }
    }
}

#Preview {
    HeirarchicalCodableData()
}
