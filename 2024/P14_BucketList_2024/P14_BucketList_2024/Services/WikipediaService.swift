//
//  WikipediaService.swift
//  P14_BucketList_2024
//
//  Created by  Ty Vaughan on 3/25/24.
//

import Foundation

class WikipediaService {
    static public func fetchNearbyPlaces(lat: Double, long: Double) async -> ApiResponse<WikipediaPlaceResponse.Result> {
        let urlString = "https://en.wikipedia.org/w/api.php?ggscoord=\(lat)%7C\(long)&action=query&prop=coordinates%7Cpageimages%7Cpageterms&colimit=50&piprop=thumbnail&pithumbsize=500&pilimit=50&wvptterms=description&generator=geosearch&ggsradius=10000&ggslimit=50&format=json"
        
        guard let url = URL(string: urlString) else {
            print("Bad URL: \(urlString)")
            return ApiResponse(status: .failure, result: nil)
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // we got some data back!
            let result = try JSONDecoder().decode(WikipediaPlaceResponse.Result.self, from: data)
            return ApiResponse(status: .success, result: result)
        } catch {
            // if we're still here it means the request failed somehow
            print("Caught error: \(error.localizedDescription)")
            return ApiResponse(status: .failure, result: nil)
        }
    }
}
