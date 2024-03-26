//
//  ContentView-ViewModel.swift
//  P14_BucketList_2024
//
//  Created by  Ty Vaughan on 3/25/24.
//

import Foundation
import LocalAuthentication
import MapKit
import _MapKit_SwiftUI

extension ContentView {
    
    @Observable
    class ViewModel {
        
        // MARK: Properties

        var isUnlocked = false
        private(set) var locations: [Location]
        var mapStyle: String = "standard"
        var selectedPlace: Location?
        let savePath = URL.documentsDirectory.appending(path: "SavedPlaces")
        
        var showAlert: Bool = false
        var alertTitle: String = ""
        var alertMessage: String = ""
        
        var mapStyleValue: MapStyle {
            return switch(mapStyle) {
            case "imagery": .imagery
            case "standard": .standard
            case "hybrid": .hybrid
            default: .standard
            }
        }
        
        // MARK: Constructors

        init() {
            do {
                let data = try Data(contentsOf: savePath)
                locations = try JSONDecoder().decode([Location].self, from: data)
            } catch {
                locations = []
            }
        }
        
        // MARK: Location methods

        func addLocation(at coordinate: CLLocationCoordinate2D) -> Void {
            let newLocation = Location(id: UUID(), name: "New location", description: "Description", latitude: coordinate.latitude, longitude: coordinate.longitude)
            locations.append(newLocation)
            save()
        }
        
        func saveLocation(_ location: Location) -> Void {
            if let index = locations.firstIndex(where: { loc in
                location.id == loc.id
            }) {
                locations[index] = location
            }
        }
        
        func save() {
            do {
                let data = try JSONEncoder().encode(locations)
                try data.write(to: savePath, options: [.atomic, .completeFileProtection])
            } catch {
                print("Unable to save data.")
            }
        }
        
        // MARK: Authentication methods
        
        func authenticate() {
            let context = LAContext()
            var error: NSError?
            
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                // This string is used for Touch ID. The string in Info.plist is used for Face ID
                let reason = "Please authenticate yourself to unlock your places."

                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                    if success {
                        self.isUnlocked = true
                    } else {
                        self.alertTitle = "Auth failed"
                        self.alertMessage = "Something went wrong, please try to authorize again."
                        self.showAlert = true
                    }
                }
            } else {
                // no biometrics, no reason to lock the data for this app
                self.isUnlocked = true
            }
        }
    }

}
