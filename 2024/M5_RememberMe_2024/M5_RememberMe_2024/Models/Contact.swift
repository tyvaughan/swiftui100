//
//  Contact.swift
//  M5_RememberMe_2024
//
//  Created by  Ty Vaughan on 3/27/24.
//

import CoreLocation
import Foundation
import SwiftData
import SwiftUI

@Model
class Contact: Identifiable {
    var id: UUID = UUID()
    var name: String?
    @Attribute(.externalStorage) var photo: Data?
    var latitude: Double?
    var longitude: Double?
    
    init(id: UUID = UUID(), name: String?, photo: Data?, latitude: Double?, longitude: Double?) {
        self.id = id
        self.name = name
        self.photo = photo
        self.latitude = latitude
        self.longitude = longitude
    }
    
    var displayName: String {
        name ?? "Unknown contact"
    }
    
    var displayPhoto: UIImage? {
        guard let photoData = photo else { return nil }
        guard let uiImage = UIImage(data: photoData) else { return nil }
        return uiImage
    }
    
    var displayCoordinate: CLLocationCoordinate2D? {
        if let lat = latitude, let long = latitude {
            return CLLocationCoordinate2D(latitude: lat, longitude: long)
        } else {
            return nil
        }
    }

}

// MARK: - Example
extension Contact {

    static let example: Contact = Contact(
        name: "Taylor Swift",
        photo: nil,
        latitude: 33.7488,
        longitude: -84.3877
    )

}
