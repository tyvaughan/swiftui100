//
//  SendReceiveData.swift
//  P10_CupcakeCorner_2024
//
//  Created by  Ty Vaughan on 3/11/24.
//

import SwiftUI

struct AppleMusicResponse: Codable {
    var results: [AppleMusicResult]
}

struct AppleMusicResult: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct SendReceiveData: View {
    @State private var results = [AppleMusicResult]()

    var body: some View {
        List(results, id: \.trackId) { item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
            }
        }
        .task {
            await loadData()
        }
    }
    
    func loadData() async -> Void {
        // 1. Create the URL we want to read
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        
        // 2. Fetch the data from the URL
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // 3. Convert the Data object into a Response object
            if let decodedResponse = try? JSONDecoder().decode(AppleMusicResponse.self, from: data) {
                results = decodedResponse.results
            }
        } catch {
            print("Invalid data")
        }
    }
}

#Preview {
    SendReceiveData()
}
