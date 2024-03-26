//
//  LocationEditView+ViewModel.swift
//  P14_BucketList_2024
//
//  Created by  Ty Vaughan on 3/25/24.
//

import Foundation

extension LocationEditView {
    
    @Observable
    class ViewModel {
        
        // MARK: Properties

        public var location: Location
        public var name: String
        public var description: String
        public var loadingState = LoadingState.loading
        public var pages = [WikipediaPlaceResponse.Page]()
        
        // MARK: Constructors
        
        init(location: Location) {
            self.location = location
            self.name = location.name
            self.description = location.description
        }
        
        // MARK: Service methods
        
        func getNearbyPlaces() async -> Void {
            let apiResponse = await WikipediaService.fetchNearbyPlaces(lat: location.latitude, long: location.longitude)
            
            // Ensure the call was successful and has data
            guard apiResponse.status == .success, let result = apiResponse.result else {
                self.loadingState = .failed
                return
            }
            
            // Success! Get our data
            self.pages = result.query.pages.values.sorted()
            self.loadingState = .loaded
        }
        
    }
    
}
