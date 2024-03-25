//
//  Location.swift
//  P14_BucketList_2024
//
//  Created by  Ty Vaughan on 3/24/24.
//

import Foundation
import MapKit

struct Location: Codable, Identifiable {
    var id: UUID
    var name: String
    var description: String
    var latitude: Double
    var longitude: Double
}

// MARK: - Example
extension Location {
    #if DEBUG
    static let example = Location(
        id: UUID(),
        name: "Buckingham Palace",
        description: "Lit by over 40,000 lightbulbs.",
        latitude: 51.501,
        longitude: -0.141
    )
    #endif
}

// MARK: - Equatable conformance
extension Location: Equatable {
    static func ==(lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}

// MARK: - MapKit helpers
extension Location {
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
