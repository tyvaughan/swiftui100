//
//  ContactDetailsView+ViewModel.swift
//  M5_RememberMe_2024
//
//  Created by  Ty Vaughan on 3/29/24.
//

import Foundation
import MapKit
import SwiftUI

extension ContactDetailsView {
    
    @Observable
    class ViewModel {

        let contact: Contact
        
        var startPosition: MapCameraPosition {
            if let coordinate = contact.displayCoordinate {
                return MapCameraPosition.region(
                    MKCoordinateRegion(
                        center: coordinate,
                        span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                    )
                )
            } else {
                return MapCameraPosition.region(
                    MKCoordinateRegion(
                        center: CLLocationCoordinate2D(latitude: 33.7488, longitude: -84.3877),
                        span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                    )
                )
            }
        }
        
        // MARK: Initializers

        init(contact: Contact) {
            self.contact = contact
        }

    }
    
}
